(add-hook 'ruby-mode-hook (lambda ()
                            (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
                            (set (make-local-variable 'indent-tabs-mode) 'nil)
                            (set (make-local-variable 'tab-width) 2)
                            (imenu-add-to-menubar "IMENU")
                            (ruby-electric-mode t)
                            (inf-ruby-keys)
                            (define-key help-map "r" 'ri)

                            (define-key ruby-mode-map " "         'ruby-electric-space)
                            (define-key ruby-mode-map [backspace] 'ruby-electric-backspace)
                            (define-key ruby-mode-map [delete]    'ruby-electric-delete)
                            (define-key ruby-mode-map "\C-c\C-a"  'xmp)
                            (define-key ruby-mode-map "\C-c\C-e"  'xmp)
                            ))

(add-hook 'ruby-mode-hook
      (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'emacs-lisp-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'java-mode-hook 'my-java-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'sh-mode-hook 'flymake-shell-load)


(add-hook 'ruby-mode-hook
          '(lambda ()
             (require 'flymake-ruby)
             ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
             (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
                 (flymake-ruby-load))
             ))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (add-to-list 'font-latex-match-sectioning-2-keywords-local "Absch")
            (font-latex-match-sectioning-2-make)))
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files "~/.emacs.d/contrib/html5-el/schemas.xml"))

