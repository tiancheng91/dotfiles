(autoload 'browse-url-interactive-arg "browse-url") ;; TODO why?

(autoload 'ledger-mode "ledger-mode" nil t) ;; in site-lisp, but xbps doesn't generate autoloads files

;; In contrib, thus not automatically autoloaded. Also, some files
;; don't have autoload cookies at all.
(autoload 'no-word "no-word" nil nil)
(autoload 'procmail-mode "procmail" nil t) ;; contrib
(autoload 'spelln-currency-in-words "spell-number")
(autoload 'spelln-currency-string-in-words "spell-number")
(autoload 'spelln-integer-in-words "spell-number")
(autoload 'spelln-number-customize "spell-number")
(autoload 'spelln-numeric-string-in-words "spell-number")
(autoload 'textstats "textstats" "Display text statistics" t)
(autoload 'vorbiscomment "vorbiscomment" nil t)
