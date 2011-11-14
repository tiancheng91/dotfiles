(setq TeX-auto-save t)
(setq TeX-close-quote "\"'")
(setq TeX-open-quote "\"`")
(setq TeX-parse-self t)
(setq calendar-week-start-day 1)
(setq column-number-mode t)
(setq default-major-mode 'text-mode)
(setq european-calendar-style 't)

;; (setq gc-cons-threshold 50000000) ;; ← this caused massive lags and cpu spikes when typing

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
(setq-default TeX-master nil)
(setq-default save-place t)
(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq ri-ruby-script "/usr/bin/ri-emacs")
(setq browse-url-browser-function 'w3m-browse-url)
(setq display-time-day-and-date 1)
(setq glasses-separator "")
(setq glasses-face "bold")


(setq glasses-original-separator "")
(setq spelln-language 'english-us)
(setq spelln-country 'united-states)
(setq glasses-separate-parentheses-p nil)
(setq default-tab-width 2)
(setq scroll-preserve-screen-position 'keep)
(setq user-mail-address "dominikh@fork-bomb.org")
(setq diff-switches "-c")
(setq cursor-in-non-selected-windows nil)
(setq read-file-name-completion-ignore-case t)
(setq tramp-default-method "scpc")
(setq-default font-lock-maximum-size nil)

(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq indicate-empty-lines t)
(setq message-log-max -1)
(setq textstats-auto-hide-secs 0)

(setq max-lisp-eval-depth 2000)
(setq max-specpdl-size 2000)

(setq debug-on-error nil)

(setenv "INFOPATH"
        (concat (getenv "INFOPATH") ":"
                (expand-file-name "/home/dominikh/.emacs.d/gnuplot-mode")))

(setq reftex-plug-into-AUCTeX t)
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

(setq gnus-optional-headers 'bbdb/gnus-lines-and-from)
(setq bbdb/news-auto-create-p t)

(setq smtpmail-debug-info t)

(setq mm-text-html-renderer 'w3m-standalone)
(setq gnus-treat-body-boundary 'head)
(setq gnus-body-boundary-delimiter "–")
(setq gnus-treat-hide-signature t)
(setq gnus-treat-date-local 'head)
(setq gnus-treat-date-lapsed 'head)
(setq gnus-article-date-lapsed-new-header t)


(setq imaxima-use-maxima-mode-flag t)
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00"))))
(setq org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")
(setq org-agenda-start-on-weekday nil)
(setq org-read-date-prefer-future nil)
(setq debug-on-error nil)
(setq ruby-block-highlight-toggle t)
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
               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))
               ("magit" (name . "^\\*magit.*$"))))))

(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

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
               (modes  . '(ruby-mode))))

(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "bsd")))
(setq c-basic-offset 2)

(setq-default show-trailing-whitespace t)
(setq autopair-blink nil)
