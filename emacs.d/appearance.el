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
     (font-lock-comment-face ((t (:foreground "#D0F2AE"))))
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

(setq-default mode-line-format
              '(
                (:propertize (:eval
                              (let ((host-name
                                     (or (file-remote-p default-directory 'host)
                                         (system-name))))
                                (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
                                    (substring host-name 0 (match-beginning 1))
                                  host-name)))
                             face font-lock-keyword-face)
                (:propertize ": %b" face font-lock-keyword-face)

                " "
                (vc-mode (
                          "("
                          (:propertize vc-mode face font-lock-keyword-face)
                          " )"))
                " "

                ;; line, column, rel position, size, bar
                "["
                (:propertize "%03l" face font-lock-type-face)
                ","
                (:propertize "%03c" face font-lock-type-face)
                ", "
                (:propertize "%p" face font-lock-constant-face) ;; % above top
                "/"
                (:propertize "%I" face font-lock-constant-face) ;; size
                " "
                (:eval (sml-modeline-create))
                "] "

                ;; mode-line-modes
                (
                 "["
                 (:propertize mode-name face font-lock-string-face)
                 " –"
                 mode-line-process
                 minor-mode-alist
                 "%n"
                 "%["
                 "]"
                 )

                " "
                ;; Modified/read only
                (:eval (when (buffer-modified-p)
                         '("["
                           (:propertize "Mod"
                                        face font-lock-warning-face
                                        help-echo "Buffer has been modified")
                           "]"
                           )))
                (:eval (when buffer-read-only
                         '("["
                           (:propertize "RO"
                                        face font-lock-warning-face
                                        help-echo "Buffer is read-only")
                           "]"
                           )))
                ))
