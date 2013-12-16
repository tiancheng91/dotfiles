(eval-after-load 'sh-mode '(require 'flymake-shell))
(eval-after-load 'go-mode '(require 'go-flymake))
(eval-after-load 'go-mode '(require 'company))
(eval-after-load 'go-mode '(require 'go-eldoc))
(eval-after-load 'go-mode '(require 'go-errcheck))
(eval-after-load 'company '(require 'company-go))
(eval-after-load 'jde-mode-hook '(require 'jde-ecj-flymake))
(eval-after-load 'ruby-mode '(require 'ruby-block))
(eval-after-load 'ruby-mode '(require 'flymake-ruby))

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
