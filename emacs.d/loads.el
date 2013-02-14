(eval-after-load 'sh-mode '(require 'flymake-shell))
(eval-after-load 'go-mode '(require 'go-flymake))
(eval-after-load 'go-mode '(require 'company))
(eval-after-load 'company '(require 'company-go))
(eval-after-load 'company '(require 'company-semantic))
(eval-after-load 'jde-mode-hook '(require 'jde-ecj-flymake))

(require 'compile)
(require 'etags-select)

(require 'saveplace)
(require 'template)
(require 'tramp) ;; cannot autoload this
(require 'unit-test)

(require 'glasses)
(require 'linum)
(require 'which-func)
(require 'yasnippet)
(require 'uniquify)

(require 'ruby-block)
(require 'smtpmail)
(require 'bbdb)
(require 'whattf-dt)
(require 'iedit)
(require 'recentf)
(require 'semantic-gcc)

(require 'android-mode)

(require 'gtags)

(require 'highlight-parentheses)

