(require 'color-theme)

(tool-bar-mode 0)
(menu-bar-mode 0)
(setq-default frame-title-format (list "Emacs: %b [%f]"))

(setq window-system-default-frame-alist
      '((x (background-color . "black") )))

(defun color-theme-dominikh-minimum ()
  (interactive)
  (color-theme-install
   '(color-theme-dominikh
     ((background-color . "#000000")
      (foreground-color . "#ffffff")
      (background-mode . dark)
      (border-color . "#000000")
      (cursor-color . "white")
      (mouse-color . "#FFFFFF"))
     (default ((t (nil))))
     (mode-line ((t (:foreground "#e6e9f0" :background "#323232"))))
     (region ((t (:background "#505050"))))
     (font-lock-comment-face ((t (:foreground "#ffffff" :weight bold))))
     (font-lock-constant-face ((t (:foreground "#ffffff"))))
     (font-lock-builtin-face ((t (:foreground "#ffffff"))))
     (font-lock-function-name-face ((t (:foreground "#ffffff"))))
     (font-lock-variable-name-face ((t (:foreground "#ffffff"))))
     (font-lock-keyword-face ((t (:foreground "ffffff"))))
     (font-lock-string-face ((t (:foreground "#9fff60"))))
     (font-lock-doc-string-face ((t (:foreground "#ffffff" :weight bold))))
     (font-lock-type-face ((t (:foreground "#ffffff"))))
     (web-mode-html-attr-name-face ((t (:foreground "#ffffff"))))
     (web-mode-html-tag-face ((t (:foreground "#ffffff"))))
     (web-mode-html-tag-bracket-face ((t (:foreground "#ffffff")))))))


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
     (font-lock-type-face ((t (:foreground "#FFB1B3")))))))


(color-theme-dominikh-minimum)


(defvar hcz-set-cursor-color-buffer "")
(defvar hcz-set-cursor-color-color "")
(defun hcz-set-cursor-color-according-to-mode ()
  "change cursor color according to some minor modes."
  ;;set-cursor-color is somewhat costly, so we only call it when
  ;;needed:
  (let ((color
         (if buffer-read-only "yellow"
           (if overwrite-mode "red"
             "white"))))
    (unless (and
             (string= color hcz-set-cursor-color-color)
             (string= (buffer-name) hcz-set-cursor-color-buffer))
      (set-cursor-color (setq hcz-set-cursor-color-color color))
      (setq hcz-set-cursor-color-buffer (buffer-name)))))
(add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)
