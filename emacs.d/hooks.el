(defun my-gud-mode-hook ()
  (add-to-list 'gud-jdb-classpath "~/android/android-sdk-linux/platforms/android-16/android.jar"))



(defun my-prog-mode-hook ()
  (font-lock-add-keywords nil
                          '(("\\(XXX\\|FIXME\\|TODO\\)"
                             1 font-lock-warning-face prepend))))

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'gud-mode-hook 'my-gud-mode-hook)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'prog-mode-hook 'my-prog-mode-hook)
