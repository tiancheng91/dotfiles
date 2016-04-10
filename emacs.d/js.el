(defun my-js-mode-hook ()
  (tern-mode)
  (set (make-local-variable 'company-backends) (list 'company-tern)))

(add-hook 'js-mode-hook 'my-js-mode-hook)

(eval-after-load 'tern
  (lambda ()
    (message "setting up tern map")
    (define-key tern-mode-keymap (kbd "C-c d") #'tern-get-docs)
    (define-key tern-mode-keymap (kbd "C-c C-d") #'tern-get-type)))

(defalias #'js-rename #'tern-rename-variable)
