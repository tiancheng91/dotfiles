(setq calendar-week-start-day 1)
(setq column-number-mode t)
(setq default-major-mode 'text-mode)
(setq european-calendar-style 't)

(setq hcz-set-cursor-color-buffer "")
(setq hcz-set-cursor-color-color "")
(setq inhibit-startup-message t)
(setq ispell-program-name "aspell")
(setq iswitchb-mode 1)
(setq kill-whole-line t)
(setq lpr-switches '("-PCLP-315"))
(setq mouse-yank-at-point t)
(setq org-hide-leading-stars t)
(setq org-log-done t)
(setq org-return-follows-link t)

(setq org-todo-keywords '((sequence "TODO" "|" "DONE" "SKIPPED" "COPIED")))
(setq scroll-conservatively 5)
(setq scroll-step 1)
(setq sentence-end-double-space nil)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20))
(setq vc-initial-comment t vc-diff-switches diff-switches)
(setq which-func-header-line-format
      '(which-func-mode
        ("" which-func-format
         )))
(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq browse-url-generic-program "firefox")
(setq browse-url-browser-function 'browse-url-generic)
(setq display-time-day-and-date 1)

(setq glasses-separator "")
(setq glasses-face "bold")
(setq glasses-original-separator "")
(setq glasses-separate-parentheses-p nil)

(setq spelln-language 'english-us)
(setq spelln-country 'united-states)
(setq default-tab-width 2)
(setq scroll-preserve-screen-position 'keep)
(setq diff-switches "-c")
(setq cursor-in-non-selected-windows nil)
(setq read-file-name-completion-ignore-case t)
(setq tramp-default-method "scp")
(setq-default font-lock-maximum-size nil)

(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq indicate-empty-lines t)
(setq message-log-max -1)
(setq textstats-auto-hide-secs 0)

(setq max-lisp-eval-depth 2000)
(setq max-specpdl-size 2000)

(setq selection-coding-system nil)
(setq echo-keystrokes 0.1)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")
(setq Info-directory-list Info-default-directory-list)
(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq line-move-visual t)
(setq w3m-home-page "http://www.google.com/")
(setq associated-program-alist
      '(("gnochm" "\\.chm$")
        ("evince" "\\.pdf$")
        ("mocp-play" "\\.mp3$")
        ("evince" "\\.ps$")
        ((lambda (file)
           (browse-url (concat "file:///" (expand-file-name file)))) "\\.html?$")))

(setq smtpmail-debug-info t)

(setq mm-text-html-renderer 'w3m-standalone)
(setq mm-verify-option 'known)
(setq mm-decrypt-option 'known)
(setq gnus-treat-body-boundary 'head)
(setq gnus-body-boundary-delimiter "–")
(setq gnus-treat-hide-signature t)
(setq gnus-treat-date-local 'head)
(setq gnus-treat-date-lapsed 'head)
(setq gnus-article-date-lapsed-new-header t)
(setq gnus-inhibit-startup-message t)

(setq imaxima-use-maxima-mode-flag t)
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00"))))
(setq org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")
(setq org-agenda-start-on-weekday nil)
(setq org-read-date-prefer-future nil)
(setq user-mail-address "dominikh@fork-bomb.org")
(setq smtpmail-debug-verb t)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp")
(setq message-sendmail-extra-arguments '("-a" "fork-bomb"))

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("c/c++" (or
                         (mode . c-mode)
                         (mode . c++-mode)))
               ("el" (mode . emacs-lisp-mode))
               ("perl" (mode . cperl-mode))
               ("ruby" (mode . ruby-mode))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("magit" (name . "^\\*magit.*$"))))))

(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "bsd")))
(setq c-basic-offset 2)

(setq-default show-trailing-whitespace t)
(setq autopair-blink nil)

(setq android-mode-sdk-dir "~/android/android-sdk-linux/")
(setq jde-global-classpath '("~/android/projects/" "~/android/android-sdk-linux/platforms/android-16/android.jar"))
(setq jde-ecj-command-line-args '("-d" "-1.5" "-referenceInfo" "-enableJavadoc" "-warn:all"))
(setq cedet-android-sdk-root "~/android/android-sdk-linux/")

(setq warning-minimum-level :error)


(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-minimum-prefix-length 0)               ; autocomplete right after '.'
(setq company-idle-delay t)                         ; shorter delay before autocompletion popup
(setq company-echo-delay 0)                          ; removes annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing



(setq select-active-regions t)
(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq recentf-max-menu-items 1000)
(setq projectile-indexing-method 'alien)

(setq-default fci-rule-column 113)
(setq fci-rule-color "darkred")

(setq ace-jump-mode-move-keys
      (loop for i from ?a to ?z collect i))
