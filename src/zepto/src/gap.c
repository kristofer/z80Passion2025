/* gap.c, Zepto Emacs, Public Domain, Hugh Barney, 2017, Derived from: Anthony's Editor January 93 */

//#include <sys/stat.h>
#include <fatfs.h>        // FatFS header
#include "header.h"

/* Enlarge gap by n chars, position of gap cannot change */
int growgap(buffer_t *bp, point_t n)
{
	char_t *new;
	point_t buflen, newlen, xgap, xegap;
		
	assert(bp->b_buf <= bp->b_gap);
	assert(bp->b_gap <= bp->b_egap);
	assert(bp->b_egap <= bp->b_ebuf);

	xgap = bp->b_gap - bp->b_buf;
	xegap = bp->b_egap - bp->b_buf;
	buflen = bp->b_ebuf - bp->b_buf;
    
	/* reduce number of reallocs by growing by a minimum amount */
	n = (n < MIN_GAP_EXPAND ? MIN_GAP_EXPAND : n);
	newlen = buflen + n * sizeof (char_t);

	if (buflen == 0) {
		if (newlen < 0 || MAX_SIZE_T < newlen) fatal("Failed to allocate required memory.\n");
		new = (char_t*) malloc((size_t) newlen);
		if (new == NULL) fatal("Failed to allocate required memory.\n");
	} else {
		if (newlen < 0 || MAX_SIZE_T < newlen) {
			msg("Failed to allocate required memory");
			return (FALSE);
		}
		new = (char_t*) realloc(bp->b_buf, (size_t) newlen);
		if (new == NULL) {
			msg("Failed to allocate required memory");    /* Report non-fatal error. */
			return (FALSE);
		}
	}

	/* Relocate pointers in new buffer and append the new
	 * extension to the end of the gap.
	 */
	bp->b_buf = new;
	bp->b_gap = bp->b_buf + xgap;      
	bp->b_ebuf = bp->b_buf + buflen;
	bp->b_egap = bp->b_buf + newlen;
	while (xegap < buflen--)
		*--bp->b_egap = *--bp->b_ebuf;
	bp->b_ebuf = bp->b_buf + newlen;

	assert(bp->b_buf < bp->b_ebuf);          /* Buffer must exist. */
	assert(bp->b_buf <= bp->b_gap);
	assert(bp->b_gap < bp->b_egap);          /* Gap must grow only. */
	assert(bp->b_egap <= bp->b_ebuf);
	return (TRUE);
}

point_t movegap(buffer_t *bp, point_t offset)
{
	char_t *p = ptr(bp, offset);
	while (p < bp->b_gap)
		*--bp->b_egap = *--bp->b_gap;
	while (bp->b_egap < p)
		*bp->b_gap++ = *bp->b_egap++;
	assert(bp->b_gap <= bp->b_egap);
	assert(bp->b_buf <= bp->b_gap);
	assert(bp->b_egap <= bp->b_ebuf);
	return (pos(bp, bp->b_egap));
}

/* Given a buffer offset, convert it to a pointer into the buffer */
char_t * ptr(buffer_t *bp, register point_t offset)
{
	if (offset < 0) return (bp->b_buf);
	return (bp->b_buf+offset + (bp->b_buf + offset < bp->b_gap ? 0 : bp->b_egap-bp->b_gap));
}

/* Given a pointer into the buffer, convert it to a buffer offset */
point_t pos(buffer_t *bp, register char_t *cp)
{
	assert(bp->b_buf <= cp && cp <= bp->b_ebuf);
	return (cp - bp->b_buf - (cp < bp->b_egap ? 0 : bp->b_egap - bp->b_gap));
}

// void save()
// {
// 	FILE *fp;
// 	point_t length;

// 	fp = fopen(curbp->b_fname, "w");
// 	if (fp == NULL) msg("Failed to open file \"%s\".", curbp->b_fname);
// 	(void) movegap(curbp, (point_t) 0);
// 	length = (point_t) (curbp->b_ebuf - curbp->b_egap);
// 	if (fwrite(curbp->b_egap, sizeof (char), (size_t) length, fp) != length) 
// 		msg("Failed to write file \"%s\".", curbp->b_fname);
// 	fclose(fp);
// 	curbp->b_flags &= ~B_MODIFIED;
// 	msg("File \"%s\" %ld bytes saved.", curbp->b_fname, pos(curbp, curbp->b_ebuf));
// }
void save()
{
    FIL fp;            // FatFS file object instead of FILE*
    UINT bytes_written; // Variable to store bytes written
    FRESULT fr;        // FatFS result code
    point_t length;

    fr = f_open(&fp, curbp->b_fname, FA_WRITE | FA_CREATE_ALWAYS);
    if (fr != FR_OK) {
        msg("Failed to open file \"%s\". Error: %d", curbp->b_fname, fr);
        return;
    }
    
    (void) movegap(curbp, (point_t) 0);
    length = (point_t) (curbp->b_ebuf - curbp->b_egap);
    
    fr = f_write(&fp, curbp->b_egap, length, &bytes_written);
    if (fr != FR_OK || bytes_written != length) {
        msg("Failed to write file \"%s\". Error: %d", curbp->b_fname, fr);
        f_close(&fp);
        return;
    }
    
    f_close(&fp);
    curbp->b_flags &= ~B_MODIFIED;
    msg("File \"%s\" %ld bytes saved.", curbp->b_fname, pos(curbp, curbp->b_ebuf));
}

// /* reads file into buffer at point */
// int insert_file(char *fn, int modflag)
// {
// 	FILE *fp;
// 	size_t len;
// 	struct stat sb;

// 	if (stat(fn, &sb) < 0) {
// 		msg("Failed to find file \"%s\".", fn);
// 		return (FALSE);
// 	}
// 	if (MAX_SIZE_T < sb.st_size) {
// 		msg("File \"%s\" is too big to load.", fn);
// 		return (FALSE);
// 	}
// 	if (curbp->b_egap - curbp->b_gap < sb.st_size * sizeof (char_t) && !growgap(curbp, sb.st_size))
// 		return (FALSE);
// 	if ((fp = fopen(fn, "r")) == NULL) {
// 		msg("Failed to open file \"%s\".", fn);
// 		return (FALSE);
// 	}
// 	curbp->b_point = movegap(curbp, curbp->b_point);
// 	curbp->b_gap += len = fread(curbp->b_gap, sizeof (char), (size_t) sb.st_size, fp);

// 	if (fclose(fp) != 0) {
// 		msg("Failed to close file \"%s\".", fn);
// 		return (FALSE);
// 	}
// 	curbp->b_flags &= (modflag ? B_MODIFIED : ~B_MODIFIED);
// 	msg("File \"%s\" %ld bytes read.", fn, len);
// 	return (TRUE);
// }

int insert_file(char *fn, int modflag)
{
    FIL fp;             // FatFS file object
    FILINFO fno;        // FatFS file information
    FRESULT fr;         // FatFS result code
    UINT len;           // Bytes read
    
    // Get file information
    fr = f_stat(fn, &fno);
    if (fr != FR_OK) {
        msg("Failed to find file \"%s\". Error: %d", fn, fr);
        return (FALSE);
    }
    
    // Check file size
    if (MAX_SIZE_T < fno.fsize) {
        msg("File \"%s\" is too big to load.", fn);
        return (FALSE);
    }
    
    // Grow gap if needed
    if (curbp->b_egap - curbp->b_gap < fno.fsize * sizeof(char_t) && 
        !growgap(curbp, fno.fsize))
        return (FALSE);
    
    // Open file
    fr = f_open(&fp, fn, FA_READ);
    if (fr != FR_OK) {
        msg("Failed to open file \"%s\". Error: %d", fn, fr);
        return (FALSE);
    }
    
    // Read file content
    curbp->b_point = movegap(curbp, curbp->b_point);
    fr = f_read(&fp, curbp->b_gap, fno.fsize, &len);
    if (fr != FR_OK) {
        msg("Failed to read file \"%s\". Error: %d", fn, fr);
        f_close(&fp);
        return (FALSE);
    }
    curbp->b_gap += len;
    
    // Close file
    fr = f_close(&fp);
    if (fr != FR_OK) {
        msg("Failed to close file \"%s\". Error: %d", fn, fr);
        return (FALSE);
    }
    
    curbp->b_flags &= (modflag ? B_MODIFIED : ~B_MODIFIED);
    msg("File \"%s\" %ld bytes read.", fn, (long)len);
    return (TRUE);
}