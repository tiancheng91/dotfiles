;; Lorem ipsum
(autoload 'Lorem-ipsum-insert-list "lorem-ipsum" nil t)
(autoload 'Lorem-ipsum-insert-paragraphs "lorem-ipsum" nil t)
(autoload 'Lorem-ipsum-insert-sentences "lorem-ipsum" nil t)

(autoload 'browse-url-interactive-arg "browse-url")

;; Major modes
(autoload 'apt-sources-mode "apt-sources" nil t)
(autoload 'csv-mode "csv-mode" nil t) ;; in elpa, but no autoload cookies
(autoload 'espresso-mode "espresso" nil t)
(autoload 'git-blame-mode "git-blame" nil t)
(autoload 'ledger-mode "ledger-mode" nil t) ;; in site-lisp, but xbps doesn't generate autoloads files
(autoload 'no-word "no-word" nil nil)
(autoload 'procmail-mode "procmail" nil t) ;; contrib

(autoload 'http-get "http-get" nil t)
(autoload 'http-get-debug "http-get" nil t)



(autoload 'kill-ring-search "kill-ring-search" nil t) ;; XXX broken/missing

(autoload 'macro-math-eval-and-round-region "macro-math" nil t)
(autoload 'macro-math-eval-region "macro-math" nil t)

;; Org mode
(autoload 'org-agenda "org-agenda" nil t)
(autoload 'org-agenda-list "org-agenda" nil t)
(autoload 'org-mode "org" nil t)
(autoload 'orgtbl-mode "org-table" nil t)

(autoload 'spelln-currency-in-words "spell-number")
(autoload 'spelln-currency-string-in-words "spell-number")
(autoload 'spelln-integer-in-words "spell-number")
(autoload 'spelln-number-customize "spell-number")
(autoload 'spelln-numeric-string-in-words "spell-number")

(autoload 'textstats "textstats" "Display text statistics" t)

(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)

(autoload 'vorbiscomment "vorbiscomment" nil t)

;; (autoload 'magit-status "magit" nil t)

(autoload 'jde-mode "jde" "JDE mode." t)
