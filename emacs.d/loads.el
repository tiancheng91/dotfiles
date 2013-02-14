;; (load-file "~/.emacs.d/contrib/cedet/common/cedet.el")

(require 'flymake)
(require 'flymake-shell)
(require 'go-flymake)
(require 'jde-ecj-flymake)

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
(require 'idomenu)

(require 'ruby-block)
(require 'smtpmail)
(require 'bbdb)
(require 'whattf-dt)
(require 'align)
(require 'iedit)
(require 'go-mode)
(require 'recentf)
(require 'semantic-gcc)

(require 'company)                                   ; load company mode
(require 'company-go)                                ; load company mode go backend and hook it up
(require 'company-semantic)
(setq company-backends nil)

(require 'android-mode)

(require 'jde)


(require 'gtags)

(require 'highlight-parentheses)
