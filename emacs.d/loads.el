(eval-after-load 'go-mode
  (lambda ()
    (require 'company)
    (require 'go-eldoc)
    (require 'go-errcheck)
    (require 'company-go)
    (require 'go-where)
    (require 'go-rename)
    (require 'go-guru)))

(require 'compile)
(require 'etags-select)

(require 'tramp) ;; cannot autoload this
(require 'unit-test)

(require 'glasses)
(require 'linum)
(require 'which-func)
(require 'yasnippet)
(require 'uniquify)

(require 'whattf-dt)
(require 'iedit)
(require 'recentf)

(require 'android-mode)

(require 'highlight-parentheses)

(require 'elscreen)
(require 'projectile)
(require 'deft)
(require 'rich-minority)
