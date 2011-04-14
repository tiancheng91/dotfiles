(tool-bar-mode 0)
(menu-bar-mode 0)
(setq-default frame-title-format (list "Emacs: %b [%f]"))
(add-to-list 'default-frame-alist '(foreground-color . "white"))

(setq window-system-default-frame-alist
      '((x (background-color . "black") )))


(defun color-theme-dominikh ()
  (interactive)
  (color-theme-install
   '(color-theme-dominikh
     ((background-color . "#000000")
      (foreground-color . "#FFFFFF")
      (background-mode . dark)
      (border-color . "#000000")
      (cursor-color . "#647a8e")
      (mouse-color . "#FFFFFF"))
     (default ((t (nil))))
     (mode-line ((t (:foreground "#FFFFFF" :background "#323232"))))
     (region ((t (:background "#505050"))))
     (font-lock-comment-face ((t (:foreground "#E8B27B"))))
     (font-lock-constant-face ((t (:foreground "#81FFFB"))))
     (font-lock-builtin-face ((t (:foreground "#B6F9FF"))))
     (font-lock-function-name-face ((t (:foreground "#A9C9E8"))))
     (font-lock-variable-name-face ((t (:foreground "#7BE87B"))))
     (font-lock-keyword-face ((t (:foreground "#7BB2E8"))))
     (font-lock-string-face ((t (:foreground "#FFF27D"))))
     (font-lock-doc-string-face ((t (:foreground "#B9EBB0"))))
     (font-lock-type-face ((t (:foreground "#FFB1B3"))))
     )))

(require 'color-theme)
(color-theme-dominikh)

(dolist (mode '(c-mode
                java-mode
                cperl-mode
                html-mode-hook
                css-mode-hook
                emacs-lisp-mode
                ruby-mode))
  (font-lock-add-keywords mode
                          '(("\\(XXX\\|FIXME\\|TODO\\)"
                             1 font-lock-warning-face prepend))))
(defconst my-mode-line-buffer-identification
  (list
   '(:eval
     (let ((host-name
            (or (file-remote-p default-directory 'host)
                (system-name))))
       (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
           (substring host-name 0 (match-beginning 1))
         host-name)))
   ": %12b"))

(setq-default
 mode-line-buffer-identification
 my-mode-line-buffer-identification)

(add-hook
 'dired-mode-hook
 '(lambda ()
    (setq
     mode-line-buffer-identification
     my-mode-line-buffer-identification)))
