(autoload 'browse-url-interactive-arg "browse-url") ;; TODO why?

(autoload 'ledger-mode "ledger-mode" nil t) ;; in site-lisp, but xbps doesn't generate autoloads files

;; In contrib, thus not automatically autoloaded. Also, some files
;; don't have autoload cookies at all.
(autoload 'no-word "no-word" nil nil)
(autoload 'procmail-mode "procmail" nil t) ;; contrib
(autoload 'textstats "textstats" "Display text statistics" t)
