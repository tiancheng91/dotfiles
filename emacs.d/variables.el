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
(setq mouse-yank-at-point t)
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
(setq line-move-visual t)
(setq w3m-home-page "http://www.google.com/")
(setq associated-program-alist
      '(("gnochm" "\\.chm$")
        ("evince" "\\.pdf$")
        ("mocp-play" "\\.mp3$")
        ("evince" "\\.ps$")
        ((lambda (file)
           (browse-url (concat "file:///" (expand-file-name file)))) "\\.html?$")))

(setq imaxima-use-maxima-mode-flag t)

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

(setq-default show-trailing-whitespace t)
(setq autopair-blink nil)

(setq android-mode-sdk-dir "~/android/android-sdk-linux/")
(setq jde-global-classpath '("~/android/projects/" "~/android/android-sdk-linux/platforms/android-16/android.jar"))
(setq jde-ecj-command-line-args '("-d" "-1.5" "-referenceInfo" "-enableJavadoc" "-warn:all"))
(setq cedet-android-sdk-root "~/android/android-sdk-linux/")

(setq warning-minimum-level :error)


(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

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
