(add-to-list 'ispell-local-dictionary-alist
             '("deutsch8"
               "[[:alpha:]]" "[^[:alpha:]]"
               "[']" t
               ("-C" "-d" "deutsch")
               "~latin1" iso-8859-1)
             )

(setq selection-coding-system nil)
(prefer-coding-system 'utf-8)
(if (not (assoc "UTF-8" language-info-alist))
    (set-language-environment "latin-1")
  (set-language-environment "utf-8")
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))
