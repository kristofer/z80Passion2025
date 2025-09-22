#ifndef TP_COMPILER
#define TP_COMPILER 0
#endif

#include "tp.h"

void _tp_list_realloc(_tp_list *self,int len) {
    if (!len) { len=1; }
    self->items = tp_realloc(self->items,len*sizeof(tp_obj));
    self->alloc = len;
}

void _tp_list_set(TP,_tp_list *self,int k, tp_obj v, char *error) {
    if (k >= self->len) { tp_raise(,"%s: KeyError: %d\n",error,k); }
    self->items[k] = v;
    tp_grey(tp,v);
}
void _tp_list_free(_tp_list *self) {
    tp_free(self->items);
    tp_free(self);
}

tp_obj _tp_list_get(TP,_tp_list *self,int k,char *error) {
    if (k >= self->len) { tp_raise(None,"%s: KeyError: %d\n",error,k); }
    return self->items[k];
}
void _tp_list_insertx(TP,_tp_list *self, int n, tp_obj v) {
    if (self->len >= self->alloc) {
        _tp_list_realloc(self,self->alloc*2);
    }
    if (n < self->len) { memmove(&self->items[n+1],&self->items[n],sizeof(tp_obj)*(self->len-n)); }
    self->items[n] = v;
    self->len += 1;
}
void _tp_list_appendx(TP,_tp_list *self, tp_obj v) {
    _tp_list_insertx(tp,self,self->len,v);
}
void _tp_list_insert(TP,_tp_list *self, int n, tp_obj v) {
    _tp_list_insertx(tp,self,n,v);
    tp_grey(tp,v);
}
void _tp_list_append(TP,_tp_list *self, tp_obj v) {
    _tp_list_insert(tp,self,self->len,v);
}
tp_obj _tp_list_pop(TP,_tp_list *self, int n, char *error) {
    tp_obj r = _tp_list_get(tp,self,n,error);
    if (n != self->len-1) { memmove(&self->items[n],&self->items[n+1],sizeof(tp_obj)*(self->len-(n+1))); }
    self->len -= 1;
    return r;
}

int _tp_list_find(TP,_tp_list *self, tp_obj v) {
    int n;
    for (n=0; n<self->len; n++) {
        if (tp_cmp(tp,v,self->items[n]) == 0) {
            return n;
        }
    }
    return -1;
}

tp_obj tp_index(TP) {
    tp_obj self = TP_OBJ();
    tp_obj v = TP_OBJ();
    int i = _tp_list_find(tp,self.list.val,v);
    if (i < 0) { tp_raise(None,"tp_index(%s,%s) - item not found",STR(self),STR(v)); }
    return tp_number(i);
}

_tp_list *_tp_list_new(void) {
    return tp_malloc(sizeof(_tp_list));
}

tp_obj _tp_list_copy(TP, tp_obj rr) {
    _tp_list *o = rr.list.val;
    _tp_list *r = _tp_list_new(); *r = *o;
    r->items = tp_malloc(sizeof(tp_obj)*o->alloc);
    memcpy(r->items,o->items,sizeof(tp_obj)*o->alloc);
    return tp_track(tp,(tp_obj)(tp_list_){TP_LIST,r});
}

tp_obj tp_append(TP) {
    tp_obj self = TP_OBJ();
    tp_obj v = TP_OBJ();
    _tp_list_append(tp,self.list.val,v);
    return None;
}

tp_obj tp_pop(TP) {
    tp_obj self = TP_OBJ();
    return _tp_list_pop(tp,self.list.val,self.list.val->len-1,"pop");
}

tp_obj tp_insert(TP) {
    tp_obj self = TP_OBJ();
    int n = TP_NUM();
    tp_obj v = TP_OBJ();
    _tp_list_insert(tp,self.list.val,n,v);
    return None;
}

tp_obj tp_extend(TP) {
    tp_obj self = TP_OBJ();
    tp_obj v = TP_OBJ();
    int i;
    for (i=0; i<v.list.val->len; i++) {
        _tp_list_append(tp,self.list.val,v.list.val->items[i]);
    }
    return None;
}

tp_obj tp_list(TP) {
    tp_obj r = (tp_obj)(tp_list_){TP_LIST,_tp_list_new()};
    return tp?tp_track(tp,r):r;
}

tp_obj tp_list_n(TP,int n,tp_obj *argv) {
    tp_obj r = tp_list(tp); _tp_list_realloc(r.list.val,n);
    int i; for (i=0; i<n; i++) { _tp_list_append(tp,r.list.val,argv[i]); }
    return r;
}

int _tp_sort_cmp(tp_obj *a,tp_obj *b) {
    return tp_cmp(0,*a,*b);
}
tp_obj tp_sort(TP) {
    tp_obj self = TP_OBJ();
    qsort(self.list.val->items, self.list.val->len, sizeof(tp_obj), (int(*)(const void*,const void*))_tp_sort_cmp);
    return None;
}



//


int tp_lua_hash(void *v,int l) {
    int i,step = (l>>5)+1;
    int h = l + (l >= 4?*(int*)v:0);
    for (i=l; i>=step; i-=step) {
        h = h^((h<<5)+(h>>2)+((unsigned char *)v)[i-1]);
    }
    return h;
}
void _tp_dict_free(_tp_dict *self) {
    tp_free(self->items);
    tp_free(self);
}

// void _tp_dict_reset(_tp_dict *self) {
//     memset(self->items,0,self->alloc*sizeof(tp_item));
//     self->len = 0;
//     self->used = 0;
//     self->cur = 0;
// }

int tp_hash(TP,tp_obj v) {
    switch (v.type) {
        case TP_NONE: return 0;
        case TP_NUMBER: return tp_lua_hash(&v.number.val,sizeof(tp_num));
        case TP_STRING: return tp_lua_hash(v.string.val,v.string.len);
        case TP_DICT: return tp_lua_hash(&v.dict.val,sizeof(void*));
        case TP_LIST: {
            int r = v.list.val->len; int n; for(n=0; n<v.list.val->len; n++) {
            tp_obj vv = v.list.val->items[n]; r += vv.type != TP_LIST?tp_hash(tp,v.list.val->items[n]):tp_lua_hash(&vv.list.val,sizeof(void*)); } return r;
        }
        case TP_FNC: return tp_lua_hash(&v.fnc.val,sizeof(void*));
        case TP_DATA: return tp_lua_hash(&v.data.val,sizeof(void*));
    }
    tp_raise(0,"tp_hash(%s)",STR(v));
}

void _tp_dict_hash_set(TP,_tp_dict *self, int hash, tp_obj k, tp_obj v) {
    int i,idx = hash&self->mask;
    for (i=idx; i<idx+self->alloc; i++) {
        int n = i&self->mask;
        if (self->items[n].used > 0) { continue; }
        if (self->items[n].used == 0) { self->used += 1; }
        self->items[n] = (tp_item){1,hash,k,v};
        self->len += 1;
        return;
    }
    tp_raise(,"_tp_dict_hash_set(%d,%d,%s,%s)",self,hash,STR(k),STR(v));
}

void _tp_dict_tp_realloc(TP,_tp_dict *self,int len) {
    len = _tp_max(8,len);
    tp_item *items = self->items;
    int i,alloc = self->alloc;

    self->items = tp_malloc(len*sizeof(tp_item));
    self->alloc = len; self->mask = len-1;
    self->len = 0; self->used = 0;

    for (i=0; i<alloc; i++) {
        if (items[i].used != 1) { continue; }
        _tp_dict_hash_set(tp,self,items[i].hash,items[i].key,items[i].val);
    }
    tp_free(items);
}

int _tp_dict_hash_find(TP,_tp_dict *self, int hash, tp_obj k) {
    int i,idx = hash&self->mask;
    for (i=idx; i<idx+self->alloc; i++) {
        int n = i&self->mask;
        if (self->items[n].used == 0) { break; }
        if (self->items[n].used < 0) { continue; }
        if (self->items[n].hash != hash) { continue; }
        if (tp_cmp(tp,self->items[n].key,k) != 0) { continue; }
        return n;
    }
    return -1;
}
int _tp_dict_find(TP,_tp_dict *self,tp_obj k) {
    return _tp_dict_hash_find(tp,self,tp_hash(tp,k),k);
}

void _tp_dict_setx(TP,_tp_dict *self,tp_obj k, tp_obj v) {
    int hash = tp_hash(tp,k); int n = _tp_dict_hash_find(tp,self,hash,k);
    if (n == -1) {
        if (self->len >= (self->alloc/2)) {
            _tp_dict_tp_realloc(tp,self,self->alloc*2);
        } else if (self->used >= (self->alloc*3/4)) {
            _tp_dict_tp_realloc(tp,self,self->alloc);
        }
        _tp_dict_hash_set(tp,self,hash,k,v);
    } else {
        self->items[n].val = v;
    }
}

void _tp_dict_set(TP,_tp_dict *self,tp_obj k, tp_obj v) {
    _tp_dict_setx(tp,self,k,v);
    tp_grey(tp,k); tp_grey(tp,v);
}

tp_obj _tp_dict_get(TP,_tp_dict *self,tp_obj k, char *error) {
    int n = _tp_dict_find(tp,self,k);
    if (n < 0) {
        tp_raise(None,"%s: KeyError: %s\n",error,STR(k));
    }
    return self->items[n].val;
}

void _tp_dict_del(TP,_tp_dict *self,tp_obj k, char *error) {
    int n = _tp_dict_find(tp,self,k);
    if (n < 0) { tp_raise(,"%s: KeyError: %s\n",error,STR(k)); }
    self->items[n].used = -1;
    self->len -= 1;
}

_tp_dict *_tp_dict_new(void) {
    _tp_dict *self = tp_malloc(sizeof(_tp_dict));
    return self;
}
tp_obj _tp_dict_copy(TP,tp_obj rr) {
    _tp_dict *o = rr.dict.val;
    _tp_dict *r = _tp_dict_new(); *r = *o;
    r->items = tp_malloc(sizeof(tp_item)*o->alloc);
    memcpy(r->items,o->items,sizeof(tp_item)*o->alloc);
    return tp_track(tp,(tp_obj)(tp_dict_){TP_DICT,r});
}

int _tp_dict_next(TP,_tp_dict *self) {
    if (!self->len) { tp_raise(0,"_tp_dict_next(...)",0); }
    while (1) {
        self->cur = ((self->cur + 1) & self->mask);
        if (self->items[self->cur].used > 0) {
            return self->cur;
        }
    }
}

tp_obj tp_merge(TP) {
    tp_obj self = TP_OBJ();
    tp_obj v = TP_OBJ();
    int i; for (i=0; i<v.dict.val->len; i++) {
        int n = _tp_dict_next(tp,v.dict.val);
        _tp_dict_set(tp,self.dict.val,
            v.dict.val->items[n].key,v.dict.val->items[n].val);
    }
    return None;
}

tp_obj tp_dict(TP) {
    tp_obj r = (tp_obj)(tp_dict_){TP_DICT,_tp_dict_new()};
    return tp?tp_track(tp,r):r;
}

tp_obj tp_dict_n(TP,int n, tp_obj* argv) {
    tp_obj r = tp_dict(tp);
    int i; for (i=0; i<n; i++) { tp_set(tp,r,argv[i*2],argv[i*2+1]); }
    return r;
}


tp_obj *tp_ptr(tp_obj o) {
    tp_obj *ptr = tp_malloc(sizeof(tp_obj)); *ptr = o;
    return ptr;
}

tp_obj _tp_dcall(TP,tp_obj fnc(TP)) {
    return fnc(tp);
}
tp_obj _tp_tcall(TP,tp_obj fnc) {
    if (fnc.fnc.ftype&2) {
        _tp_list_insert(tp,tp->params.list.val,0,fnc.fnc.val->self);
    }
    return _tp_dcall(tp,fnc.fnc.fval);
}

tp_obj tp_fnc_new(TP,int t, void *v, tp_obj s, tp_obj g) {
    tp_obj r;
    r.type = TP_FNC;
    _tp_fnc *self = tp_malloc(sizeof(_tp_fnc));
    self->self = s;
    self->globals = g;
    r.fnc.ftype = t;
    r.fnc.val = self;
    r.fnc.fval = v;
    return tp_track(tp,r);
}

tp_obj tp_def(TP,void *v, tp_obj g) {
    return tp_fnc_new(tp,1,v,None,g);
}

tp_obj tp_fnc(TP,tp_obj v(TP)) {
    return tp_fnc_new(tp,0,v,None,None);
}
tp_obj tp_method(TP,tp_obj self,tp_obj v(TP)) {
    return tp_fnc_new(tp,2,v,self,None);
}

tp_obj tp_data(TP,void *v) {
    tp_obj r = (tp_obj)(tp_data_){TP_DATA,tp_malloc(sizeof(_tp_data)),v,0};
    r.data.meta = &r.data.info->meta;
    return tp_track(tp,r);
}

tp_obj tp_params(TP) {
    tp->params = tp->_params.list.val->items[tp->cur];
    tp_obj r = tp->_params.list.val->items[tp->cur];
    r.list.val->len = 0;
    return r;
}
tp_obj tp_params_n(TP,int n, tp_obj argv[]) {
    tp_obj r = tp_params(tp);
    int i; for (i=0; i<n; i++) { _tp_list_append(tp,r.list.val,argv[i]); }
    return r;
}
tp_obj tp_params_v(TP,int n,...) {
    tp_obj r = tp_params(tp);
    va_list a; va_start(a,n);
    int i; for(i=0; i<n; i++) { _tp_list_append(tp,r.list.val,va_arg(a,tp_obj)); }
    va_end(a);
    return r;
}

//

tp_obj tp_string_t(TP, int n) {
    tp_obj r = tp_string_n(0,n);
    r.string.info = tp_malloc(sizeof(_tp_string)+n);
    r.string.val = r.string.info->s;
    return r;
}

tp_obj tp_printf(TP,char *fmt,...) {
    va_list arg;
    va_start(arg, fmt);
    int l = vsnprintf(NULL, 0, fmt,arg);
    tp_obj r = tp_string_t(tp,l);
    char *s = r.string.val;
    va_end(arg);
    va_start(arg, fmt);
    vsprintf(s,fmt,arg);
    va_end(arg);
    return tp_track(tp,r);
}

int _tp_str_index(tp_obj s, tp_obj k) {
    int i=0;
    while ((s.string.len - i) >= k.string.len) {
        if (memcmp(s.string.val+i,k.string.val,k.string.len) == 0) {
            return i;
        }
        i += 1;
    }
    return -1;
}

tp_obj tp_join(TP) {
    tp_obj delim = TP_OBJ();
    tp_obj val = TP_OBJ();
    int l=0,i;
    for (i=0; i<val.list.val->len; i++) {
        if (i!=0) { l += delim.string.len; }
        l += tp_str(tp,val.list.val->items[i]).string.len;
    }
    tp_obj r = tp_string_t(tp,l);
    char *s = r.string.val;
    l = 0;
    for (i=0; i<val.list.val->len; i++) {
        if (i!=0) {
            memcpy(s+l,delim.string.val,delim.string.len); l += delim.string.len;
        }
        tp_obj e = tp_str(tp,val.list.val->items[i]);
        memcpy(s+l,e.string.val,e.string.len); l += e.string.len;
    }
    return tp_track(tp,r);
}

tp_obj tp_string_slice(TP,tp_obj s, int a, int b) {
    tp_obj r = tp_string_t(tp,b-a);
    char *m = r.string.val;
    memcpy(m,s.string.val+a,b-a);
    return tp_track(tp,r);
}

tp_obj tp_split(TP) {
    tp_obj v = TP_OBJ();
    tp_obj d = TP_OBJ();
    tp_obj r = tp_list(tp);

    int i;
    while ((i=_tp_str_index(v,d))!=-1) {
        _tp_list_append(tp,r.list.val,tp_string_slice(tp,v,0,i));
        v.string.val += i + d.string.len; v.string.len -= i + d.string.len;
//         tp_grey(tp,r); // should stop gc or something instead
    }
    _tp_list_append(tp,r.list.val,tp_string_slice(tp,v,0,v.string.len));
//     tp_grey(tp,r); // should stop gc or something instead
    return r;
}


tp_obj tp_find(TP) {
    tp_obj s = TP_OBJ();
    tp_obj v = TP_OBJ();
    return tp_number(_tp_str_index(s,v));
}

tp_obj tp_str_index(TP) {
    tp_obj s = TP_OBJ();
    tp_obj v = TP_OBJ();
    int n = _tp_str_index(s,v);
    if (n >= 0) { return tp_number(n); }
    tp_raise(None,"tp_str_index(%s,%s)",s,v);
}

tp_obj tp_str2(TP) {
    tp_obj v = TP_OBJ();
    return tp_str(tp,v);
}

tp_obj tp_chr(TP) {
    int v = TP_NUM();
    return tp_string_n(tp->chars[(unsigned char)v],1);
}
tp_obj tp_ord(TP) {
    char *s = TP_STR();
    return tp_number(s[0]);
}

tp_obj tp_strip(TP) {
    char *v = TP_STR();
    int i, l = strlen(v); int a = l, b = 0;
    for (i=0; i<l; i++) {
        if (v[i] != ' ' && v[i] != '\n' && v[i] != '\t' && v[i] != '\r') {
            a = _tp_min(a,i); b = _tp_max(b,i+1);
        }
    }
    if ((b-a) < 0) { return tp_string(""); }
    tp_obj r = tp_string_t(tp,b-a);
    char *s = r.string.val;
    memcpy(s,v+a,b-a);
    return tp_track(tp,r);
}


tp_obj tp_replace(TP) {
    tp_obj s = TP_OBJ();
    tp_obj k = TP_OBJ();
    tp_obj v = TP_OBJ();
    tp_obj p = s;
    int i,n = 0;
    while ((i = _tp_str_index(p,k)) != -1) {
        n += 1;
        p.string.val += i + k.string.len; p.string.len -= i + k.string.len;
    }
//     fprintf(stderr,"ns: %d\n",n);
    int l = s.string.len + n * (v.string.len-k.string.len);
    int c;
    tp_obj rr = tp_string_t(tp,l);
    char *r = rr.string.val;
    char *d = r;
    tp_obj z; z = p = s;
    while ((i = _tp_str_index(p,k)) != -1) {
        p.string.val += i; p.string.len -= i;
        memcpy(d,z.string.val,c=(p.string.val-z.string.val)); d += c;
        p.string.val += k.string.len; p.string.len -= k.string.len;
        memcpy(d,v.string.val,v.string.len); d += v.string.len;
        z = p;
    }
    memcpy(d,z.string.val,(s.string.val + s.string.len) - z.string.val);

    return tp_track(tp,rr);
}

tp_obj tp_print(TP) {
    int n = 0;
    tp_obj e;
    TP_LOOP(e)
        if (n) { printf(" "); }
        printf("%s",STR(e));
        n += 1;
    TP_END;
    printf("\n");
    return None;
}

tp_obj tp_bind(TP) {
    tp_obj r = TP_OBJ();
    tp_obj self = TP_OBJ();
    return tp_fnc_new(tp,r.fnc.ftype|2,r.fnc.fval,self,r.fnc.val->globals);
}

tp_obj tp_min(TP) {
    tp_obj r = TP_OBJ();
    tp_obj e;
    TP_LOOP(e)
        if (tp_cmp(tp,r,e) > 0) { r = e; }
    TP_END;
    return r;
}

tp_obj tp_max(TP) {
    tp_obj r = TP_OBJ();
    tp_obj e;
    TP_LOOP(e)
        if (tp_cmp(tp,r,e) < 0) { r = e; }
    TP_END;
    return r;
}

tp_obj tp_copy(TP) {
    tp_obj r = TP_OBJ();
    int type = r.type;
    if (type == TP_LIST) {
        return _tp_list_copy(tp,r);
    } else if (type == TP_DICT) {
        return _tp_dict_copy(tp,r);
    }
    tp_raise(None,"tp_copy(%s)",STR(r));
}


tp_obj tp_len_(TP) {
    tp_obj e = TP_OBJ();
    return tp_len(tp,e);
}


tp_obj tp_assert(TP) {
    int a = TP_NUM();
    if (a) { return None; }
    tp_raise(None,"%s","assert failed");
}

tp_obj tp_range(TP) {
    int a = TP_NUM();
    int b = TP_NUM();
    int c = TP_DEFAULT(tp_number(1)).number.val;
    tp_obj r = tp_list(tp);
    int i;
    for (i=a; i!=b; i+=c) { _tp_list_append(tp,r.list.val,tp_number(i)); }
    return r;
}


tp_obj tp_system(TP) {
    char *s = TP_STR();
    int r = 1; //system(s);
    return tp_number(r);
}

tp_obj tp_istype(TP) {
    tp_obj v = TP_OBJ();
    char *t = TP_STR();
    if (strcmp("string",t) == 0) { return tp_number(v.type == TP_STRING); }
    if (strcmp("list",t) == 0) { return tp_number(v.type == TP_LIST); }
    if (strcmp("dict",t) == 0) { return tp_number(v.type == TP_DICT); }
    if (strcmp("number",t) == 0) { return tp_number(v.type == TP_NUMBER); }
    tp_raise(None,"is_type(%s,%s)",STR(v),t);
}


tp_obj tp_float(TP) {
    tp_obj v = TP_OBJ();
    int ord = TP_DEFAULT(tp_number(0)).number.val;
    int type = v.type;
    if (type == TP_NUMBER) { return v; }
    if (type == TP_STRING) {
        if (strchr(STR(v),'.')) { return tp_number(atof(STR(v))); }
        return(tp_number(strtol(STR(v),0,ord)));
    }
    tp_raise(None,"tp_float(%s)",STR(v));
}


tp_obj tp_save(TP) {
    char *fname = TP_STR();
    tp_obj v = TP_OBJ();
    FILE *f;
    f = fopen(fname,"wb");
    if (!f) { tp_raise(None,"tp_save(%s,...)",fname); }
    fwrite(v.string.val,v.string.len,1,f);
    fclose(f);
    return None;
}


tp_obj tp_load(TP) {
    //FIL fp;             // FatFS file object
    FILINFO fno;        // FatFS file information
    FILE *f;
    FRESULT fr;         // FatFS result code
    uint24_t bytes_read;    // Bytes actually read
    long l;
    // Get file information instead of using stat()
    printf("in tp_load");
   char *fname = TP_STR();
   fr = ffs_stat(&fno, fname);
    //struct stat stbuf; stat(fname, &stbuf); long l = stbuf.st_size;
    l = fno.fsize;
    f = fopen(fname,"rb");
    if (!f) { tp_raise(None,"tp_load(%s)",fname); }
    tp_obj r = tp_string_t(tp,l);
    char *s = r.string.val;
    fread(s,1,l,f);
    fclose(f);
    return tp_track(tp,r);
}


tp_obj tp_fpack(TP) {
    tp_num v = TP_NUM();
    tp_obj r = tp_string_t(tp,sizeof(tp_num));
    *(tp_num*)r.string.val = v;
    return tp_track(tp,r);
}

tp_obj tp_abs(TP) {
    return tp_number(fabs(tp_float(tp).number.val));
}
tp_obj tp_int(TP) {
    return tp_number((long)tp_float(tp).number.val);
}
tp_num _roundf(tp_num v) {
    tp_num av = fabs(v); tp_num iv = (long)av;
    av = (av-iv < 0.5?iv:iv+1);
    return (v<0?-av:av);
}
tp_obj tp_round(TP) {
    return tp_number(_roundf(tp_float(tp).number.val));
}

tp_obj tp_exists(TP) {
    // char *s = TP_STR();
    // struct stat stbuf;
    // return tp_number(!stat(s,&stbuf));
    return tp_number(1);
}

tp_obj tp_mtime(TP) {
    // char *s = TP_STR();
    // struct stat stbuf;
    // if (!stat(s,&stbuf)) { return tp_number(stbuf.st_mtime); }
    // tp_raise(None,"tp_mtime(%s)",s);
    return tp_number(0);
}

// gc.c
//
// tp_obj tp_track(TP,tp_obj v) { return v; }
// void tp_grey(TP,tp_obj v) { }
// void tp_full(TP) { }
// void tp_gc_init(TP) { }
// void tp_gc_deinit(TP) { }
// void tp_delete(TP,tp_obj v) { }

void tp_grey(TP,tp_obj v) {
    if (v.type < TP_STRING || (!v.gci.data) || *v.gci.data) { return; }
    *v.gci.data = 1;
    if (v.type == TP_STRING || v.type == TP_DATA) {
        _tp_list_appendx(tp,tp->black,v);
        return;
    }
    _tp_list_appendx(tp,tp->grey,v);
}

void tp_follow(TP,tp_obj v) {
    int type = v.type;
    if (type == TP_LIST) {
        int n;
        for (n=0; n<v.list.val->len; n++) {
            tp_grey(tp,v.list.val->items[n]);
        }
    }
    if (type == TP_DICT) {
        int i;
        for (i=0; i<v.dict.val->len; i++) {
            int n = _tp_dict_next(tp,v.dict.val);
            tp_grey(tp,v.dict.val->items[n].key);
            tp_grey(tp,v.dict.val->items[n].val);
        }
    }
    if (type == TP_FNC) {
        tp_grey(tp,v.fnc.val->self);
        tp_grey(tp,v.fnc.val->globals);
    }
}

void tp_reset(TP) {
    int n;
    for (n=0; n<tp->black->len; n++) {
        *tp->black->items[n].gci.data = 0;
    }
    _tp_list *tmp = tp->white; tp->white = tp->black; tp->black = tmp;
}

void tp_gc_init(TP) {
    tp->white = _tp_list_new();
    tp->strings = _tp_dict_new();
    tp->grey = _tp_list_new();
    tp->black = _tp_list_new();
    tp->steps = 0;
}

void tp_gc_deinit(TP) {
    _tp_list_free(tp->white);
    _tp_dict_free(tp->strings);
    _tp_list_free(tp->grey);
    _tp_list_free(tp->black);
}

void tp_delete(TP,tp_obj v) {
    int type = v.type;
    if (type == TP_LIST) {
        _tp_list_free(v.list.val);
        return;
    } else if (type == TP_DICT) {
        _tp_dict_free(v.dict.val);
        return;
    } else if (type == TP_STRING) {
        tp_free(v.string.info);
        return;
    } else if (type == TP_DATA) {
        if (v.data.meta && v.data.meta->free) {
            v.data.meta->free(tp,v);
        }
        tp_free(v.data.info);
        return;
    } else if (type == TP_FNC) {
        tp_free(v.fnc.val);
        return;
    }
    tp_raise(,"tp_delete(%s)",STR(v));
}

void tp_collect(TP) {
    int n;
    for (n=0; n<tp->white->len; n++) {
        tp_obj r = tp->white->items[n];
        if (*r.gci.data) { continue; }
        if (r.type == TP_STRING) {
            //this can't be moved into tp_delete, because tp_delete is
            // also used by tp_track_s to delete redundant strings
            _tp_dict_del(tp,tp->strings,r,"tp_collect");
        }
        tp_delete(tp,r);
    }
    tp->white->len = 0;
    tp_reset(tp);
}

void _tp_gcinc(TP) {
    if (!tp->grey->len) { return; }
    tp_obj v = _tp_list_pop(tp,tp->grey,tp->grey->len-1,"_tp_gcinc");
    tp_follow(tp,v);
    _tp_list_appendx(tp,tp->black,v);
}

void tp_full(TP) {
    while (tp->grey->len) {
        _tp_gcinc(tp);
    }
    tp_collect(tp);
    tp_follow(tp,tp->root);
}

void tp_gcinc(TP) {
    tp->steps += 1;
    if (tp->steps < TP_GCMAX || tp->grey->len > 0) {
        _tp_gcinc(tp); _tp_gcinc(tp);
    }
    if (tp->steps < TP_GCMAX || tp->grey->len > 0) { return; }
    tp->steps = 0;
    tp_full(tp);
    return;
}

tp_obj tp_track(TP,tp_obj v) {
    if (v.type == TP_STRING) {
        int i = _tp_dict_find(tp,tp->strings,v);
        if (i != -1) {
            tp_delete(tp,v);
            v = tp->strings->items[i].key;
            tp_grey(tp,v);
            return v;
        }
        _tp_dict_setx(tp,tp->strings,v,True);
    }
    tp_gcinc(tp);
    tp_grey(tp,v);
    return v;
}

//
// ops.c

tp_obj tp_str(TP,tp_obj self) {
    int type = self.type;
    if (type == TP_STRING) { return self; }
    if (type == TP_NUMBER) {
        tp_num v = self.number.val;
        if ((fabs(v)-labs((long)v)) < 0.000001) { return tp_printf(tp,"%ld",(long)v); }
        return tp_printf(tp,"%f",v);
    } else if(type == TP_DICT) {
        return tp_printf(tp,"<dict 0x%x>",self.dict.val);
    } else if(type == TP_LIST) {
        return tp_printf(tp,"<list 0x%x>",self.list.val);
    } else if (type == TP_NONE) {
        return tp_string("None");
    } else if (type == TP_DATA) {
        return tp_printf(tp,"<data 0x%x>",self.data.val);
    } else if (type == TP_FNC) {
        return tp_printf(tp,"<fnc 0x%x>",self.fnc.val);
    }
    return tp_string("<?>");
}

int tp_bool(TP,tp_obj v) {
    switch(v.type) {
        case TP_NUMBER: return v.number.val != 0;
        case TP_NONE: return 0;
        case TP_STRING: return v.string.len != 0;
        case TP_LIST: return v.list.val->len != 0;
        case TP_DICT: return v.dict.val->len != 0;
    }
    return 1;
}


tp_obj tp_has(TP,tp_obj self, tp_obj k) {
    int type = self.type;
    if (type == TP_DICT) {
        if (_tp_dict_find(tp,self.dict.val,k) != -1) { return True; }
        return False;
    } else if (type == TP_STRING && k.type == TP_STRING) {
        char *p = strstr(STR(self),STR(k));
        return tp_number(p != 0);
    } else if (type == TP_LIST) {
        return tp_number(_tp_list_find(tp,self.list.val,k)!=-1);
    }
    tp_raise(None,"tp_has(%s,%s)",STR(self),STR(k));
}

void tp_del(TP,tp_obj self, tp_obj k) {
    int type = self.type;
    if (type == TP_DICT) {
        _tp_dict_del(tp,self.dict.val,k,"tp_del");
        return;
    }
    tp_raise(,"tp_del(%s,%s)",STR(self),STR(k));
}


tp_obj tp_iter(TP,tp_obj self, tp_obj k) {
    int type = self.type;
    if (type == TP_LIST || type == TP_STRING) { return tp_get(tp,self,k); }
    if (type == TP_DICT && k.type == TP_NUMBER) {
        return self.dict.val->items[_tp_dict_next(tp,self.dict.val)].key;
    }
    tp_raise(None,"tp_iter(%s,%s)",STR(self),STR(k));
}

tp_obj tp_get(TP,tp_obj self, tp_obj k) {
    int type = self.type;
    if (type == TP_DICT) {
        return _tp_dict_get(tp,self.dict.val,k,"tp_get");
    } else if (type == TP_LIST) {
        if (k.type == TP_NUMBER) {
            int l = tp_len(tp,self).number.val;
            int n = k.number.val;
            n = (n<0?l+n:n);
            return _tp_list_get(tp,self.list.val,n,"tp_get");
        } else if (k.type == TP_STRING) {
            if (strcmp("append",STR(k)) == 0) {
                return tp_method(tp,self,tp_append);
            } else if (strcmp("pop",STR(k)) == 0) {
                return tp_method(tp,self,tp_pop);
            } else if (strcmp("index",STR(k)) == 0) {
                return tp_method(tp,self,tp_index);
            } else if (strcmp("sort",STR(k)) == 0) {
                return tp_method(tp,self,tp_sort);
            } else if (strcmp("extend",STR(k)) == 0) {
                return tp_method(tp,self,tp_extend);
            } else if (strcmp("*",STR(k)) == 0) {
                tp_params_v(tp,1,self); tp_obj r = tp_copy(tp);
                self.list.val->len=0;
                return r;
            }
        } else if (k.type == TP_NONE) {
            return _tp_list_pop(tp,self.list.val,0,"tp_get");
        }
    } else if (type == TP_STRING) {
        if (k.type == TP_NUMBER) {
            int l = self.string.len;
            int n = k.number.val;
            n = (n<0?l+n:n);
            if (n >= 0 && n < l) { return tp_string_n(tp->chars[(unsigned char)self.string.val[n]],1); }
        } else if (k.type == TP_STRING) {
            if (strcmp("join",STR(k)) == 0) {
                return tp_method(tp,self,tp_join);
            } else if (strcmp("split",STR(k)) == 0) {
                return tp_method(tp,self,tp_split);
            } else if (strcmp("index",STR(k)) == 0) {
                return tp_method(tp,self,tp_str_index);
            } else if (strcmp("strip",STR(k)) == 0) {
                return tp_method(tp,self,tp_strip);
            } else if (strcmp("replace",STR(k)) == 0) {
                return tp_method(tp,self,tp_replace);
            }
        }
    } else if (type == TP_DATA) {
        return self.data.meta->get(tp,self,k);
    }

    if (k.type == TP_LIST) {
        int a,b,l;
        tp_obj tmp;
        l = tp_len(tp,self).number.val;
        tmp = tp_get(tp,k,tp_number(0));
        if (tmp.type == TP_NUMBER) { a = tmp.number.val; }
        else if(tmp.type == TP_NONE) { a = 0; }
        else { tp_raise(None,"%s is not a number",STR(tmp)); }
        tmp = tp_get(tp,k,tp_number(1));
        if (tmp.type == TP_NUMBER) { b = tmp.number.val; }
        else if(tmp.type == TP_NONE) { b = l; }
        else { tp_raise(None,"%s is not a number",STR(tmp)); }
        a = _tp_max(0,(a<0?l+a:a)); b = _tp_min(l,(b<0?l+b:b));
        if (type == TP_LIST) {
            return tp_list_n(tp,b-a,&self.list.val->items[a]);
        } else if (type == TP_STRING) {
            tp_obj r = tp_string_t(tp,b-a);
            char *ptr = r.string.val;
            memcpy(ptr,self.string.val+a,b-a); ptr[b-a]=0;
            return tp_track(tp,r);
        }
    }



    tp_raise(None,"tp_get(%s,%s)",STR(self),STR(k));
}

int tp_iget(TP,tp_obj *r, tp_obj self, tp_obj k) {
    if (self.type == TP_DICT) {
        int n = _tp_dict_find(tp,self.dict.val,k);
        if (n == -1) { return 0; }
        *r = self.dict.val->items[n].val;
        tp_grey(tp,*r);
        return 1;
    }
    if (self.type == TP_LIST && !self.list.val->len) { return 0; }
    *r = tp_get(tp,self,k); tp_grey(tp,*r);
    return 1;
}

void tp_set(TP,tp_obj self, tp_obj k, tp_obj v) {
    int type = self.type;

    if (type == TP_DICT) {
        _tp_dict_set(tp,self.dict.val,k,v);
        return;
    } else if (type == TP_LIST) {
        if (k.type == TP_NUMBER) {
            _tp_list_set(tp,self.list.val,k.number.val,v,"tp_set");
            return;
        } else if (k.type == TP_NONE) {
            _tp_list_append(tp,self.list.val,v);
            return;
        } else if (k.type == TP_STRING) {
            if (strcmp("*",STR(k)) == 0) {
                tp_params_v(tp,2,self,v); tp_extend(tp);
                return;
            }
        }
    } else if (type == TP_DATA) {
        self.data.meta->set(tp,self,k,v);
        return;
    }
    tp_raise(,"tp_set(%s,%s,%s)",STR(self),STR(k),STR(v));
}

tp_obj tp_add(TP,tp_obj a, tp_obj b) {
    if (a.type == TP_NUMBER && a.type == b.type) {
        return tp_number(a.number.val+b.number.val);
    } else if (a.type == TP_STRING && a.type == b.type) {
        int al = a.string.len, bl = b.string.len;
        tp_obj r = tp_string_t(tp,al+bl);
        char *s = r.string.val;
        memcpy(s,a.string.val,al); memcpy(s+al,b.string.val,bl);
        return tp_track(tp,r);
    } else if (a.type == TP_LIST && a.type == b.type) {
        tp_params_v(tp,1,a); tp_obj r = tp_copy(tp);
        tp_params_v(tp,2,r,b); tp_extend(tp);
        return r;
    }
    tp_raise(None,"tp_add(%s,%s)",STR(a),STR(b));
}

tp_obj tp_mul(TP,tp_obj a, tp_obj b) {
    if (a.type == TP_NUMBER && a.type == b.type) {
        return tp_number(a.number.val*b.number.val);
    } else if (a.type == TP_STRING && b.type == TP_NUMBER) {
        int al = a.string.len; int n = b.number.val;
        tp_obj r = tp_string_t(tp,al*n);
        char *s = r.string.val;
        int i; for (i=0; i<n; i++) { memcpy(s+al*i,a.string.val,al); }
        return tp_track(tp,r);
    }
    tp_raise(None,"tp_mul(%s,%s)",STR(a),STR(b));
}


tp_obj tp_len(TP,tp_obj self) {
    int type = self.type;
    if (type == TP_STRING) {
        return tp_number(self.string.len);
    } else if (type == TP_DICT) {
        return tp_number(self.dict.val->len);
    } else if (type == TP_LIST) {
        return tp_number(self.list.val->len);
    }
    tp_raise(None,"tp_len(%s)",STR(self));
}

int tp_cmp(TP,tp_obj a, tp_obj b) {
    if (a.type != b.type) { return a.type-b.type; }
    switch(a.type) {
        case TP_NONE: return 0;
        case TP_NUMBER: return _tp_sign(a.number.val-b.number.val);
        case TP_STRING: {
            int v = memcmp(a.string.val,b.string.val,_tp_min(a.string.len,b.string.len));
            if (v == 0) { v = a.string.len-b.string.len; }
            return v;
        }
        case TP_LIST: {
            int n,v; for(n=0;n<_tp_min(a.list.val->len,b.list.val->len);n++) {
        tp_obj aa = a.list.val->items[n]; tp_obj bb = b.list.val->items[n];
            if (aa.type == TP_LIST && bb.type == TP_LIST) { v = aa.list.val-bb.list.val; } else { v = tp_cmp(tp,aa,bb); }
            if (v) { return v; } }
            return a.list.val->len-b.list.val->len;
        }
        case TP_DICT: return a.dict.val - b.dict.val;
        case TP_FNC: return a.fnc.val - b.fnc.val;
        case TP_DATA: return a.data.val - b.data.val;
    }
    tp_raise(0,"tp_cmp(%s,%s)",STR(a),STR(b));
}

#define TP_OP(name,expr) \
    tp_obj name(TP,tp_obj _a,tp_obj _b) { \
    if (_a.type == TP_NUMBER && _a.type == _b.type) { \
        tp_num a = _a.number.val; tp_num b = _b.number.val; \
        return tp_number(expr); \
    } \
    tp_raise(None,"%s(%s,%s)",#name,STR(_a),STR(_b)); \
}

TP_OP(tp_and,((long)a)&((long)b));
TP_OP(tp_or,((long)a)|((long)b));
TP_OP(tp_mod,((long)a)%((long)b));
TP_OP(tp_lsh,((long)a)<<((long)b));
TP_OP(tp_rsh,((long)a)>>((long)b));
TP_OP(tp_sub,a-b);
TP_OP(tp_div,a/b);
TP_OP(tp_pow,pow(a,b));


//

// vm.c
//

tp_vm *_tp_init(void) {
    int i;
    tp_vm *tp = tp_malloc(sizeof(tp_vm));
    tp->cur = 0;
    tp->jmp = 0;
    tp->ex = None;
    tp->root = tp_list(0);
    for (i=0; i<256; i++) { tp->chars[i][0]=i; }
    tp_gc_init(tp);
    tp->_regs = tp_list(tp);
    for (i=0; i<TP_REGS; i++) { tp_set(tp,tp->_regs,None,None); }
    tp->builtins = tp_dict(tp);
    tp->modules = tp_dict(tp);
    tp->_params = tp_list(tp);
    for (i=0; i<TP_FRAMES; i++) { tp_set(tp,tp->_params,None,tp_list(tp)); }
    tp_set(tp,tp->root,None,tp->builtins);
    tp_set(tp,tp->root,None,tp->modules);
    tp_set(tp,tp->root,None,tp->_regs);
    tp_set(tp,tp->root,None,tp->_params);
    tp_set(tp,tp->builtins,tp_string("MODULES"),tp->modules);
    tp_set(tp,tp->modules,tp_string("BUILTINS"),tp->builtins);
    tp_set(tp,tp->builtins,tp_string("BUILTINS"),tp->builtins);
    tp->regs = tp->_regs.list.val->items;
    tp_full(tp);
    printf("end _tp_init()\n");
    return tp;
}

void tp_deinit(TP) {
    while (tp->root.list.val->len) {
        _tp_list_pop(tp,tp->root.list.val,0,"tp_deinit");
    }
    tp_full(tp); tp_full(tp);
    tp_delete(tp,tp->root);
    tp_gc_deinit(tp);
    tp_free(tp);
}


// tp_frame_
void tp_frame(TP,tp_obj globals,tp_code *codes,tp_obj *ret_dest) {
    tp_frame_ f;
    f.globals = globals;
    f.codes = codes;
    f.cur = f.codes;
    f.jmp = 0;
//     fprintf(stderr,"tp->cur: %d\n",tp->cur);
    f.regs = (tp->cur <= 0?tp->regs:tp->frames[tp->cur].regs+tp->frames[tp->cur].cregs);
    f.ret_dest = ret_dest;
    f.lineno = 0;
    f.line = tp_string("");
    f.name = tp_string("?");
    f.fname = tp_string("?");
    f.cregs = 0;
//     return f;
    if (f.regs+256 >= tp->regs+TP_REGS || tp->cur >= TP_FRAMES-1) { tp_raise(,"tp_frame: stack overflow %d",tp->cur); }
    tp->cur += 1;
    tp->frames[tp->cur] = f;
}

void _tp_raise(TP,tp_obj e) {
    if (!tp || !tp->jmp) {
        printf("\nException:\n%s\n",STR(e));
        exit(-1);
        return;
    }
    if (e.type != TP_NONE) { tp->ex = e; }
    tp_grey(tp,e);
    longjmp(tp->buf,1);
}

void tp_print_stack(TP) {
    printf("\n");
    int i;
    for (i=0; i<=tp->cur; i++) {
        if (!tp->frames[i].lineno) { continue; }
        printf("File \"%s\", line %d, in %s\n  %s\n",
            STR(tp->frames[i].fname),tp->frames[i].lineno,STR(tp->frames[i].name),STR(tp->frames[i].line));
    }
    printf("\nException:\n%s\n",STR(tp->ex));
}



void tp_handle(TP) {
    int i;
    for (i=tp->cur; i>=0; i--) {
        if (tp->frames[i].jmp) { break; }
    }
    if (i >= 0) {
        tp->cur = i;
        tp->frames[i].cur = tp->frames[i].jmp;
        tp->frames[i].jmp = 0;
        return;
    }
    tp_print_stack(tp);
    exit(-1);
}

void _tp_call(TP,tp_obj *dest, tp_obj fnc, tp_obj params) {
    if (fnc.type == TP_DICT) {
        return _tp_call(tp,dest,tp_get(tp,fnc,tp_string("__call__")),params);
    }
    if (fnc.type == TP_FNC && !(fnc.fnc.ftype&1)) {
        *dest = _tp_tcall(tp,fnc);
        tp_grey(tp,*dest);
        return;
    }
    if (fnc.type == TP_FNC) {
        tp_frame(tp,fnc.fnc.val->globals,fnc.fnc.fval,dest);
        if ((fnc.fnc.ftype&2)) {
            tp->frames[tp->cur].regs[0] = params;
            _tp_list_insert(tp,params.list.val,0,fnc.fnc.val->self);
        } else {
            tp->frames[tp->cur].regs[0] = params;
        }
        return;
    }
    tp_params_v(tp,1,fnc); tp_print(tp);
    tp_raise(,"tp_call: %s is not callable",STR(fnc));
}


void tp_return(TP, tp_obj v) {
    tp_obj *dest = tp->frames[tp->cur].ret_dest;
    if (dest) { *dest = v; tp_grey(tp,v); }
//     memset(tp->frames[tp->cur].regs,0,TP_REGS_PER_FRAME*sizeof(tp_obj));
//     fprintf(stderr,"regs:%d\n",(tp->frames[tp->cur].cregs+1));
    memset(tp->frames[tp->cur].regs,0,tp->frames[tp->cur].cregs*sizeof(tp_obj));
    tp->cur -= 1;
}

enum {
    TP_IEOF,TP_IADD,TP_ISUB,TP_IMUL,TP_IDIV,TP_IPOW,TP_IAND,TP_IOR,TP_ICMP,TP_IGET,TP_ISET,
    TP_INUMBER,TP_ISTRING,TP_IGGET,TP_IGSET,TP_IMOVE,TP_IDEF,TP_IPASS,TP_IJUMP,TP_ICALL,
    TP_IRETURN,TP_IIF,TP_IDEBUG,TP_IEQ,TP_ILE,TP_ILT,TP_IDICT,TP_ILIST,TP_INONE,TP_ILEN,
    TP_ILINE,TP_IPARAMS,TP_IIGET,TP_IFILE,TP_INAME,TP_INE,TP_IHAS,TP_IRAISE,TP_ISETJMP,
    TP_IMOD,TP_ILSH,TP_IRSH,TP_IITER,TP_IDEL,TP_IREGS,
    TP_ITOTAL
};

// char *tp_strings[TP_ITOTAL] = {
//     "EOF","ADD","SUB","MUL","DIV","POW","AND","OR","CMP","GET","SET","NUM",
//     "STR","GGET","GSET","MOVE","DEF","PASS","JUMP","CALL","RETURN","IF","DEBUG",
//     "EQ","LE","LT","DICT","LIST","NONE","LEN","LINE","PARAMS","IGET","FILE",
//     "NAME","NE","HAS","RAISE","SETJMP","MOD","LSH","RSH","ITER","DEL","REGS",
// };

#define VA ((int)e.regs.a)
#define VB ((int)e.regs.b)
#define VC ((int)e.regs.c)
#define RA regs[e.regs.a]
#define RB regs[e.regs.b]
#define RC regs[e.regs.c]
#define UVBC (unsigned short)(((VB<<8)+VC))
#define SVBC (short)(((VB<<8)+VC))
#define GA tp_grey(tp,RA)
#define SR(v) f->cur = cur; return(v);

int tp_step(TP) {
    tp_frame_ *f = &tp->frames[tp->cur];
    tp_obj *regs = f->regs;
    tp_code *cur = f->cur;
    while(1) {
    tp_code e = *cur;
//     fprintf(stderr,"%2d.%4d: %-6s %3d %3d %3d\n",tp->cur,cur-f->codes,tp_strings[e.i],VA,VB,VC);
//     int i; for(i=0;i<16;i++) { fprintf(stderr,"%d: %s\n",i,STR(regs[i])); }
    switch (e.i) {
        case TP_IEOF: tp_return(tp,None); SR(0); break;
        case TP_IADD: RA = tp_add(tp,RB,RC); break;
        case TP_ISUB: RA = tp_sub(tp,RB,RC); break;
        case TP_IMUL: RA = tp_mul(tp,RB,RC); break;
        case TP_IDIV: RA = tp_div(tp,RB,RC); break;
        case TP_IPOW: RA = tp_pow(tp,RB,RC); break;
        case TP_IAND: RA = tp_and(tp,RB,RC); break;
        case TP_IOR:  RA = tp_or(tp,RB,RC); break;
        case TP_IMOD:  RA = tp_mod(tp,RB,RC); break;
        case TP_ILSH:  RA = tp_lsh(tp,RB,RC); break;
        case TP_IRSH:  RA = tp_rsh(tp,RB,RC); break;
        case TP_ICMP: RA = tp_number(tp_cmp(tp,RB,RC)); break;
        case TP_INE: RA = tp_number(tp_cmp(tp,RB,RC)!=0); break;
        case TP_IEQ: RA = tp_number(tp_cmp(tp,RB,RC)==0); break;
        case TP_ILE: RA = tp_number(tp_cmp(tp,RB,RC)<=0); break;
        case TP_ILT: RA = tp_number(tp_cmp(tp,RB,RC)<0); break;
        case TP_IPASS: break;
        case TP_IIF: if (tp_bool(tp,RA)) { cur += 1; } break;
        case TP_IGET: RA = tp_get(tp,RB,RC); GA; break;
        case TP_IITER:
            if (RC.number.val < tp_len(tp,RB).number.val) {
                RA = tp_iter(tp,RB,RC); GA;
                RC.number.val += 1;
                cur += 1;
            }
            break;
        case TP_IHAS: RA = tp_has(tp,RB,RC); break;
        case TP_IIGET: tp_iget(tp,&RA,RB,RC); break;
        case TP_ISET: tp_set(tp,RA,RB,RC); break;
        case TP_IDEL: tp_del(tp,RA,RB); break;
        case TP_IMOVE: RA = RB; break;
        case TP_INUMBER:
            RA = tp_number(*(tp_num*)(*++cur).string.val);
            cur += sizeof(tp_num)/4;
            continue;
        case TP_ISTRING:
            RA = tp_string_n((*(cur+1)).string.val,UVBC);
            cur += (UVBC/4)+1;
            break;
        case TP_IDICT: RA = tp_dict_n(tp,VC/2,&RB); break;
        case TP_ILIST: RA = tp_list_n(tp,VC,&RB); break;
        case TP_IPARAMS: RA = tp_params_n(tp,VC,&RB); break;
        case TP_ILEN: RA = tp_len(tp,RB); break;
        case TP_IJUMP: cur += SVBC; continue; break;
        case TP_ISETJMP: f->jmp = cur+SVBC; break;
        case TP_ICALL: _tp_call(tp,&RA,RB,RC); cur++; SR(0); break;
        case TP_IGGET:
            if (!tp_iget(tp,&RA,f->globals,RB)) {
                RA = tp_get(tp,tp->builtins,RB); GA;
            }
            break;
        case TP_IGSET: tp_set(tp,f->globals,RA,RB); break;
        case TP_IDEF:
            RA = tp_def(tp,(*(cur+1)).string.val,f->globals);
            cur += SVBC; continue;
            break;
        case TP_IRETURN: tp_return(tp,RA); SR(0); break;
        case TP_IRAISE: _tp_raise(tp,RA); SR(0); break;
        case TP_IDEBUG:
            tp_params_v(tp,3,tp_string("DEBUG:"),tp_number(VA),RA); tp_print(tp);
            break;
        case TP_INONE: RA = None; break;
        case TP_ILINE:
            f->line = tp_string_n((*(cur+1)).string.val,VA*4-1);
//             fprintf(stderr,"%7d: %s\n",UVBC,f->line.string.val);
            cur += VA; f->lineno = UVBC;
            break;
        case TP_IFILE: f->fname = RA; break;
        case TP_INAME: f->name = RA; break;
        case TP_IREGS: f->cregs = VA; break;
        default: tp_raise(0,"tp_step: invalid instruction %d",e.i); break;
    }
    cur += 1;
    }
    SR(0);
}

void tp_run(TP,int cur) {
    if (tp->jmp) { tp_raise(,"tp_run(%d) called recusively",cur); }
    tp->jmp = 1; if (setjmp(tp->buf)) { tp_handle(tp); }
    while (tp->cur >= cur && tp_step(tp) != -1);
    tp->cur = cur-1; tp->jmp = 0;
}


tp_obj tp_call(TP, char *mod, char *fnc, tp_obj params) {
    tp_obj tmp;
    tp_obj r = None;
    tmp = tp_get(tp,tp->modules,tp_string(mod));
    tmp = tp_get(tp,tmp,tp_string(fnc));
    _tp_call(tp,&r,tmp,params);
    tp_run(tp,tp->cur);
    return r;
}

tp_obj tp_import(TP,char *fname, char *name, void *codes) {
    if (!((fname && strstr(fname,".tpc")) || codes)) {
        return tp_call(tp,"py2bc","import_fname",tp_params_v(tp,2,tp_string(fname),tp_string(name)));
    }

    tp_obj code = None;
    if (!codes) {
        tp_params_v(tp,1,tp_string(fname));
        code = tp_load(tp);
        codes = code.string.val;
    } else {
        code = tp_data(tp,codes);
    }
    printf("after load");

    tp_obj g = tp_dict(tp);
    tp_set(tp,g,tp_string("__name__"),tp_string(name));
    tp_set(tp,g,tp_string("__code__"),code);
    tp_frame(tp,g,codes,0);
    tp_set(tp,tp->modules,tp_string(name),g);

    if (!tp->jmp) { tp_run(tp,tp->cur); }

    return g;
}



tp_obj tp_exec_(TP) {
    tp_obj code = TP_OBJ();
    tp_obj globals = TP_OBJ();
    tp_frame(tp,globals,(void*)code.string.val,0);
    return None;
}


tp_obj tp_import_(TP) {
    tp_obj mod = TP_OBJ();

    if (tp_has(tp,tp->modules,mod).number.val) {
        return tp_get(tp,tp->modules,mod);
    }

    char *s = STR(mod);
    tp_obj r = tp_import(tp,STR(tp_add(tp,mod,tp_string(".tpc"))),s,0);
    return r;
}

#define TP_IB(a,b) tp_set(tp,ctx,tp_string(a),tp_fnc(tp,b))

tp_obj tp_builtins(TP) {
    tp_obj ctx = tp->builtins;
    TP_IB("print",tp_print); TP_IB("range",tp_range); TP_IB("min",tp_min);
    TP_IB("max",tp_max); TP_IB("bind",tp_bind); TP_IB("copy",tp_copy);
    TP_IB("import",tp_import_); TP_IB("len",tp_len_); TP_IB("assert",tp_assert);
    TP_IB("str",tp_str2); TP_IB("float",tp_float); TP_IB("system",tp_system);
    TP_IB("istype",tp_istype); TP_IB("chr",tp_chr); TP_IB("save",tp_save);
    TP_IB("load",tp_load); TP_IB("fpack",tp_fpack); TP_IB("abs",tp_abs);
    TP_IB("int",tp_int); TP_IB("exec",tp_exec_); TP_IB("exists",tp_exists);
    TP_IB("mtime",tp_mtime); TP_IB("number",tp_float); TP_IB("round",tp_round);
    TP_IB("ord",tp_ord); TP_IB("merge",tp_merge);
    return ctx;
}


void tp_args(TP,int argc, char *argv[]) {
    tp_obj self = tp_list(tp);
    int i;
    for (i=1; i<argc; i++) { _tp_list_append(tp,self.list.val,tp_string(argv[i])); }
    tp_set(tp,tp->builtins,tp_string("ARGV"),self);
}


tp_obj tp_main(TP,char *fname, void *code) {
    return tp_import(tp,fname,"__main__",code);
}
tp_obj tp_compile(TP, tp_obj text, tp_obj fname) {
    return tp_call(tp,"BUILTINS","compile",tp_params_v(tp,2,text,fname));
}

tp_obj tp_exec(TP,tp_obj code, tp_obj globals) {
    tp_obj r=None;
    tp_frame(tp,globals,(void*)code.string.val,&r);
    tp_run(tp,tp->cur);
    return r;
}

tp_obj tp_eval(TP, char *text, tp_obj globals) {
    tp_obj code = tp_compile(tp,tp_string(text),tp_string("<eval>"));
    return tp_exec(tp,code,globals);
}

tp_vm *tp_init(int argc, char *argv[]) {
    tp_vm *tp = _tp_init();
    tp_builtins(tp);
    tp_args(tp,argc,argv);
    //tp_compiler(tp);
    return tp;
}


//

//#define TP_COMPILER 0

int main(int argc, char *argv[]) {
    tp_vm *tp = tp_init(argc,argv);
    printf("tp init\n");
    tp_import(tp,argv[1],"__main__",0);
    tp_deinit(tp);
    printf("tp deinit\n");

    return(0);
}
