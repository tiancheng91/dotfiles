(defun my-LaTeX-mode-hook ()
  (add-to-list 'font-latex-match-sectioning-2-keywords-local "Absch")
  (font-latex-match-sectioning-2-make)
  (turn-on-reftex))

(defun my-c-mode-hook ()
  (setq comment-start "//"
        comment-end   ""
        c-basic-offset 4
        indent-tabs-mode t
        c-backspace-function 'delete-backward-char)
  (c-set-offset 'arglist-cont-nonempty '++))


(defun my-gud-mode-hook ()
  (add-to-list 'gud-jdb-classpath "~/android/android-sdk-linux/platforms/android-16/android.jar"))

(defun my-ibuffer-mode-hook ()
  (ibuffer-switch-to-saved-filter-groups "default"))

(defun my-prog-mode-hook ()
  (font-lock-add-keywords nil
                          '(("\\(XXX\\|FIXME\\|TODO\\)"
                             1 font-lock-warning-face prepend))))


(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'gud-mode-hook 'my-gud-mode-hook)
(add-hook 'ibuffer-mode-hook 'my-ibuffer-mode-hook)
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)
(add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'prog-mode-hook 'my-prog-mode-hook)
