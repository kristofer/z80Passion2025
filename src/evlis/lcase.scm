(let loop ((c (read-char)))
  (cond ((not (eof-object? c))
	  (write-char (char-downcase c))
	  (loop (read-char)))))
