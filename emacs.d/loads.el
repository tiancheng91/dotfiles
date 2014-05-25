(eval-after-load 'go-mode '(require 'company))
(eval-after-load 'go-mode '(require 'go-eldoc))
(eval-after-load 'go-mode '(require 'go-errcheck))
(eval-after-load 'company '(require 'company-go))
(eval-after-load 'ruby-mode '(require 'ruby-block))

(require 'compile)
(require 'etags-select)

(require 'template)
(require 'tramp) ;; cannot autoload this
(require 'unit-test)

(require 'glasses)
(require 'linum)
(require 'which-func)
(require 'yasnippet)
(require 'uniquify)

(require 'smtpmail)
(require 'bbdb)
(require 'whattf-dt)
(require 'iedit)
(require 'recentf)

(require 'android-mode)

(require 'highlight-parentheses)

(require 'sml-modeline)

(require 'elscreen)
(require 'projectile)
(require 'deft)
