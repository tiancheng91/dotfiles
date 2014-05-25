(defun my-LaTeX-mode-hook ()
  (add-to-list 'font-latex-match-sectioning-2-keywords-local "Absch")
  (font-latex-match-sectioning-2-make)
  (turn-on-reftex))

(defun my-align-load-hook ()
  (add-to-list 'align-rules-list
               '(ruby-comma-delimiter
                 (regexp . ",\\(\\s-*\\)[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))
  (add-to-list 'align-rules-list
               '(ruby-hash-literal
                 (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))
  (add-to-list 'align-rules-list
               '(ruby-assignment-literal
                 (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))
  (add-to-list 'align-rules-list
               '(ruby-xmpfilter-mark
                 (regexp . "\\(\\s-*\\)# => [^#\t\n]")
                 (repeat . nil)
                 (modes  . '(ruby-mode)))))

(defun my-c-mode-hook ()
  (setq comment-start "//"
        comment-end   ""
        c-basic-offset 4
        indent-tabs-mode t
        c-backspace-function 'delete-backward-char)
  (c-set-offset 'arglist-cont-nonempty '++))

(defun my-go-mode-hook ()
  (add-to-list (make-local-variable 'company-backends) 'company-go)
  (add-hook 'before-save-hook 'gofmt-before-save nil t)
  (go-eldoc-setup))

(defun my-gud-mode-hook ()
  (add-to-list 'gud-jdb-classpath "~/android/android-sdk-linux/platforms/android-16/android.jar"))

(defun my-haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation))

(defun my-ibuffer-mode-hook ()
  (ibuffer-switch-to-saved-filter-groups "default"))

(defun my-prog-mode-hook ()
  (font-lock-add-keywords nil
                          '(("\\(XXX\\|FIXME\\|TODO\\)"
                             1 font-lock-warning-face prepend))))

(defun my-ruby-mode-hook ()
  (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
  (set (make-local-variable 'indent-tabs-mode) 'nil)
  (set (make-local-variable 'tab-width) 2)
  (imenu-add-to-menubar "IMENU")
  (define-key help-map "r" 'ri)
	(ruby-block-mode t)

  ;; Overwrite RET key as something defines it as newline
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))

(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
(add-hook 'align-load-hook 'my-align-load-hook)
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'gud-mode-hook 'my-gud-mode-hook)
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(add-hook 'ibuffer-mode-hook 'my-ibuffer-mode-hook)
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)
(add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'prog-mode-hook 'my-prog-mode-hook)
