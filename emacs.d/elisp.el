(defun my-emacs-lisp-mode-hook ()
    (eldoc-mode 1))

(eval-after-load 'emacs-lisp-mode
  (require 'eldoc))

(add-hook 'emacs-lisp-mode-hook #'my-emacs-lisp-mode-hook)
