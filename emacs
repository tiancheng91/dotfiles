;; -*- mode: emacs-lisp -*-
(setq warning-suppress-types nil)
(package-initialize)
(setq package-enable-at-startup nil)

(load "~/.emacs.d/loadpaths")
(load "~/.emacs.d/appearance")
(load "~/.emacs.d/defuns")
(load "~/.emacs.d/loads")
(load "~/.emacs.d/autoloads")
(load "~/.emacs.d/hooks")
(load "~/.emacs.d/backup")
(load "~/.emacs.d/modes")
(load "~/.emacs.d/automodes")
(load "~/.emacs.d/utf8")
(load "~/.emacs.d/keycombs")
(load "~/.emacs.d/passwords")
(load "~/.emacs.d/which-func-mode")

(load "~/.emacs.d/ace.el")
(load "~/.emacs.d/company.el")
(load "~/.emacs.d/csearch.el")
(load "~/.emacs.d/ffap.el")
(load "~/.emacs.d/flycheck.el")
(load "~/.emacs.d/gnus.el")
(load "~/.emacs.d/ibuffer.el")
(load "~/.emacs.d/isearch.el")
(load "~/.emacs.d/ido.el")
(load "~/.emacs.d/projectile.el")
(load "~/.emacs.d/server.el")
(load "~/.emacs.d/tramp")
(load "~/.emacs.d/uniquify")
(load "~/.emacs.d/windmove.el")
(load "~/.emacs.d/yasnippet.el")

;; Languages
(load "~/.emacs.d/c.el")
(load "~/.emacs.d/css.el")
(load "~/.emacs.d/go.el")
(load "~/.emacs.d/haskell.el")
(load "~/.emacs.d/latex.el")
(load "~/.emacs.d/org.el")
(load "~/.emacs.d/ruby.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-default-position "h")
 '(LaTeX-default-style "scrartcl")
 '(LaTeX-document-regexp "document\\|Artikel")
 '(LaTeX-float "h")
 '(LaTeX-indent-environment-list
   (quote
    (("shell" current-indentation)
     ("lstlisting" current-indentation)
     ("ListingUmg" current-indentation)
     ("ListingUmgS" current-indentation)
     ("BefehlUmgS" current-indentation)
     ("BefehlUmg" current-indentation)
     ("verbatim" current-indentation)
     ("verbatim*" current-indentation)
     ("array")
     ("displaymath")
     ("eqnarray")
     ("eqnarray*")
     ("equation")
     ("equation*")
     ("picture")
     ("tabbing")
     ("table")
     ("table*")
     ("tabular")
     ("tabular*")
     ("enumerate"))))
 '(LaTeX-item-indent 1)
 '(LaTeX-verbatim-regexp "verbatim\\*?\\|ListingUmg\\|BefehlUmg")
 '(TeX-newline-function (quote reindent-then-newline-and-indent))
 '(add-log-file-name-function nil)
 '(android-mode-sdk-dir "~/android/android-sdk-linux/")
 '(autotest-use-ui t)
 '(browse-url-browser-function (quote browse-url-chromium))
 '(c-hanging-semi&comma-criteria
   (quote
    (c-semi&comma-no-newlines-before-nonblanks c-semi&comma-inside-parenlist)))
 '(calendar-date-style (quote iso))
 '(calendar-week-start-day 1)
 '(case-replace nil)
 '(cedet-android-current-version "16")
 '(change-log-default-name nil)
 '(company-auto-complete-chars nil)
 '(company-backends
   (quote
    (company-irony-c-headers company-irony company-bbdb company-nxml company-css company-eclim company-semantic company-xcode company-cmake company-capf
                             (company-dabbrev-code company-gtags company-etags company-keywords)
                             company-oddmuse company-files company-dabbrev)))
 '(company-begin-commands nil)
 '(company-go-insert-arguments t)
 '(company-go-show-annotation t)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 0)
 '(company-show-numbers nil)
 '(company-tooltip-align-annotations t)
 '(company-tooltip-limit 20)
 '(company-transformers (quote (company-sort-by-backend-importance)))
 '(css-electric-brace-behavior t)
 '(css-electric-semi-behavior t)
 '(css-indent-offset 2)
 '(default-frame-alist
    (quote
     ((background-color . "#000000")
      (foreground-color . "#ffffff")
      (background-mode . dark)
      (border-color . "#000000")
      (cursor-color . "white")
      (mouse-color . "#FFFFFF")
      (vertical-scroll-bars))))
 '(default-input-method "TeX")
 '(display-time-day-and-date nil)
 '(echo-keystrokes 0.1)
 '(ede-project-directories
   (quote
    ("/home/dominikh/android/projects/HelloWorld" "/home/dominikh/android/projects")))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elscreen-tab-display-control nil)
 '(fci-rule-color "darkred")
 '(fci-rule-column 113)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade javascript-eslint javascript-jshint javascript-gjslint javascript-jscs javascript-standard json-jsonlint json-python-json less luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim sql-sqlint tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby gometalinter)))
 '(flycheck-completion-system (quote ido))
 '(flycheck-display-errors-function (quote ignore))
 '(flycheck-highlighting-mode nil)
 '(flycheck-navigation-minimum-level (quote error))
 '(font-latex-fontify-script nil)
 '(font-latex-fontify-sectioning 1.1)
 '(font-latex-match-sectioning-3-keywords (quote (("Absch" ""))))
 '(font-latex-match-sectioning-4-keywords (quote (("UAbsch" ""))))
 '(font-latex-match-sectioning-5-keywords (quote (("UUAbsch" ""))))
 '(gimp-exe "gimp")
 '(go-impl-aliases-alist
   (quote
    (("sort" . "sort.Interface")
     ("string" . "fmt.Stringer"))))
 '(go-impl-enter-function t)
 '(godoc-at-point-function (quote godoc-gogetdoc))
 '(gofmt-command "goimports")
 '(gofmt-show-errors (quote buffer))
 '(haml-backspace-backdents-nesting t)
 '(hippie-expand-try-functions-list
   (quote
    (try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(hl-paren-colors
   (quote
    ("firebrick1" "IndianRed1" "IndianRed3" "IndianRed4" "sienna")))
 '(ibuffer-formats
   (quote
    ((mark modified read-only " "
           (name 18 18 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (vc-status 16 16 :left)
     (mark " "
           (name 16 -1)
           " " filename))))
 '(ido-auto-merge-work-directories-length -1)
 '(ido-default-buffer-method (quote selected-window))
 '(ido-enable-flex-matching t)
 '(ido-enable-regexp nil)
 '(ido-everywhere t)
 '(ido-ignore-buffers (quote ("\\` " "\\*tramp/.+")))
 '(ido-mode (quote both) nil (ido))
 '(ido-unc-hosts nil)
 '(ido-use-filename-at-point nil)
 '(ido-use-url-at-point nil)
 '(imaxima-bg-color "black")
 '(imaxima-fg-color "white")
 '(imaxima-fnt-size "huge")
 '(imaxima-image-type (quote png))
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 600000)
 '(imenu-max-item-length nil)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(ispell-program-name "aspell")
 '(jde-compiler
   (quote
    (("eclipse java compiler server" "/home/dominikh/android/eclipse/plugins/org.eclipse.jdt.core_3.8.1.v20120531-0637.jar"))))
 '(jde-compiler-new-compile-el t)
 '(js-indent-level 2)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-cleanup-whitespace t)
 '(js2-enter-indents-newline t)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key t)
 '(kill-whole-line t)
 '(line-move-visual t)
 '(lpr-headers-switches nil)
 '(lpr-page-header-program "pr")
 '(lpr-page-header-switches (quote ("-h" "%s" "-F" "-o 5")))
 '(magit-process-popup-time 5)
 '(magit-revert-buffers t)
 '(magit-save-some-buffers nil)
 '(major-mode (quote text-mode))
 '(max-lisp-eval-depth 2000)
 '(max-specpdl-size 2000)
 '(message-log-max -1)
 '(mouse-yank-at-point t)
 '(mumamo-chunk-coloring 999)
 '(mumamo-set-major-mode-delay -1)
 '(nxhtml-default-encoding (quote utf-8))
 '(nxhtml-skip-welcome t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files (quote ("~/notes/agenda.org")))
 '(org-descriptive-links t)
 '(org-ellipsis (quote org-warning))
 '(org-startup-folded nil)
 '(org-startup-truncated nil)
 '(org-tab-follows-link t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(php-basic-offset 2)
 '(php-speedbar-config nil)
 '(popcmp-group-alternatives nil)
 '(popwin:special-display-config
   (quote
    (("*Miniedit Help*" :noselect t)
     (help-mode)
     (completion-list-mode :noselect t)
     (compilation-mode :noselect t)
     (grep-mode :noselect t)
     (occur-mode :noselect t)
     ("*Pp Macroexpand Output*" :noselect t)
     ("*Shell Command Output*")
     ("*vc-diff*")
     ("*vc-change-log*")
     (" *undo-tree*" :width 60 :position right)
     ("^\\*anything.*\\*$" :regexp t)
     ("*slime-apropos*")
     ("*slime-macroexpansion*")
     ("*slime-description*")
     ("*slime-compilation*" :noselect t)
     ("*slime-xref*")
     (sldb-mode :stick t)
     (slime-repl-mode)
     (slime-connection-list-mode)
     ("*Gofmt Errors*" :regexp nil))))
 '(post-email-address "dominikh@fork-bomb.org")
 '(post-jump-header t)
 '(post-kill-quoted-sig t)
 '(pr-print-using-ghostscript nil)
 '(ps-always-build-face-reference t)
 '(ps-paper-type (quote a4))
 '(read-file-name-completion-ignore-case t)
 '(recentf-max-menu-items 1000)
 '(require-final-newline t)
 '(rm-blacklist
   (quote
    (" yas" " hl-p" " Projectile" " Anzu" " company" " o^o" " ElDoc")))
 '(ruby-block-delay 0.1)
 '(ruby-deep-arglist 1)
 '(ruby-electric-expand-delimiters-list nil)
 '(safe-local-variable-values
   (quote
    ((eval progn
           (make-local-variable
            (quote process-environment))
           (setenv "GOPATH"
                   (expand-file-name
                    (locate-dominating-file buffer-file-name ".dir-locals.el"))))
     (eval progn
           (setenv "GOPATH"
                   (expand-file-name
                    (locate-dominating-file buffer-file-name ".dir-locals.el"))))
     (eval progn
           (setenv "GOPATH"
                   (locate-dominating-file buffer-file-name ".dir-locals.el")))
     (TeX-brace-indent-level . 2)
     (LaTeX-indent-level . 2)
     (TeX-brace-indent-level . 0)
     (TeX-brace-indent-level)
     (LaTeX-indent-level . 0)
     (whitespace-action auto-cleanup)
     (whitespace-action quote
                        (auto-cleanup))
     (Coding . iso-2022-7bit)
     (whitespace-action)
     (encoding . utf-8))))
 '(scroll-conservatively 5)
 '(scroll-preserve-screen-position (quote keep))
 '(scroll-step 1)
 '(sentence-end-double-space nil)
 '(show-trailing-whitespace t)
 '(sml-modeline-len 30)
 '(sml-modeline-numbers (quote line-numbers))
 '(spelln-country (quote united-states))
 '(spelln-language (quote english-us))
 '(standard-indent 2)
 '(tab-width 4)
 '(tags-case-fold-search nil)
 '(tags-table-list nil)
 '(textstats-auto-hide-secs 0)
 '(tramp-encoding-shell "/bin/bash")
 '(user-full-name "Dominik Honnef")
 '(vc-follow-symlinks t)
 '(w3-use-terminal-characters t)
 '(w3m-default-display-inline-images t)
 '(warning-minimum-level :error)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-quoting nil)
 '(which-func-modes
   (quote
    (emacs-lisp-mode c-mode c++-mode perl-mode cperl-mode python-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode diff-mode ruby-mode go-mode)))
 '(which-function-mode t)
 '(whitespace-action nil)
 '(whitespace-modes
   (quote
    (ada-mode asm-mode autoconf-mode awk-mode c-mode c++-mode cc-mode change-log-mode cperl-mode electric-nroff-mode emacs-lisp-mode f90-mode fortran-mode html-mode html3-mode java-mode jde-mode ksh-mode latex-mode LaTeX-mode lisp-mode m4-mode makefile-mode modula-2-mode nroff-mode objc-mode pascal-mode perl-mode prolog-mode python-mode scheme-mode sgml-mode sh-mode shell-script-mode simula-mode tcl-mode tex-mode texinfo-mode vrml-mode xml-mode ruby-mode)))
 '(whitespace-style (quote (trailing space-mark tab-mark)))
 '(whitespace-tab (quote whitespace-tab))
 '(woman-use-own-frame nil)
 '(x-select-enable-clipboard nil)
 '(x-select-enable-primary t)
 '(yas-fallback-behavior (quote return-nil))
 '(yas-prompt-functions
   (quote
    (yas-dropdown-prompt yas-completing-prompt yas-ido-prompt yas-no-prompt)))
 '(yas-snippet-dirs
   (quote
    ("~/.emacs.d/snippets" "~/.emacs.d/snippets_go" yas-installed-snippets-dir "/home/dominikh/.emacs.d/elpa/haskell-mode-20150403.1144/snippets")) nil (yasnippet)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-mode-line ((t nil)))
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-template-field ((t (:inherit yas-field-highlight-face))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "#7BB2E8" :foreground "black"))))
 '(cursor ((t (:background "white"))))
 '(elscreen-tab-background-face ((t (:background "black"))))
 '(flycheck-warning ((t (:underline (:color "light goldenrod" :style wave)))))
 '(font-lock-yard-face ((t nil)) t)
 '(go-guru-hl-identifier-face ((t (:inherit highlight))))
 '(highlight ((t (:underline t))))
 '(isearch ((t (:underline t :slant italic))))
 '(js2-function-param ((t nil)))
 '(lazy-highlight ((t (:underline t))))
 '(ledger-font-account-directive-face ((t nil)))
 '(ledger-font-alias-directive-face ((t nil)))
 '(ledger-font-apply-directive-face ((t nil)))
 '(ledger-font-assert-directive-face ((t nil)))
 '(ledger-font-auto-xact-face ((t nil)))
 '(ledger-font-bucket-directive-face ((t nil)))
 '(ledger-font-capture-directive-face ((t nil)))
 '(ledger-font-check-directive-face ((t nil)))
 '(ledger-font-comment-face ((t nil)))
 '(ledger-font-commodity-directive-face ((t nil)))
 '(ledger-font-define-directive-face ((t nil)))
 '(ledger-font-directive-face ((t nil)))
 '(ledger-font-end-directive-face ((t nil)))
 '(ledger-font-expr-directive-face ((t nil)))
 '(ledger-font-fixed-directive-face ((t nil)))
 '(ledger-font-include-directive-face ((t nil)))
 '(ledger-font-other-face ((t nil)))
 '(ledger-font-payee-cleared-face ((t nil)))
 '(ledger-font-payee-directive-face ((t nil)))
 '(ledger-font-payee-pending-face ((t nil)))
 '(ledger-font-payee-uncleared-face ((t nil)))
 '(ledger-font-pending-face ((t nil)))
 '(ledger-font-periodic-xact-face ((t nil)))
 '(ledger-font-posting-account-cleared-face ((t nil)))
 '(ledger-font-posting-account-face ((t nil)))
 '(ledger-font-posting-account-pending-face ((t nil)))
 '(ledger-font-posting-amount-cleared-face ((t nil)))
 '(ledger-font-posting-amount-face ((t nil)))
 '(ledger-font-posting-amount-pending-face ((t nil)))
 '(ledger-font-posting-date-face ((t nil)))
 '(ledger-font-reconciler-cleared-face ((t nil)))
 '(ledger-font-reconciler-pending-face ((t nil)))
 '(ledger-font-reconciler-uncleared-face ((t nil)))
 '(ledger-font-report-clickable-face ((t nil)))
 '(ledger-font-tag-directive-face ((t nil)))
 '(ledger-font-xact-cleared-face ((t nil)))
 '(ledger-font-xact-highlight-face ((t nil)))
 '(ledger-font-xact-open-face ((t nil)))
 '(ledger-font-xact-pending-face ((t nil)))
 '(ledger-font-year-directive-face ((t nil)))
 '(ledger-occur-xact-face ((t nil)))
 '(linum ((t (:inherit shadow :background "black" :foreground "#BED3E8" :weight ultra-bold :height 0.8))))
 '(magit-item-highlight ((t nil)))
 '(mode-line ((((class color) (min-colors 88)) (:background "brightblack" :foreground "white" :box -1))))
 '(mode-line-inactive ((t (:inherit mode-line :background "black" :foreground "white" :box (:line-width -1 :color "grey40") :weight light))))
 '(org-checkbox ((t (:inherit bold))))
 '(org-column ((t (:strike-through nil :underline nil :slant normal :weight normal))))
 '(org-table ((t nil)))
 '(tabs-current ((t (:inherit tabs-face :background "grey40"))))
 '(tabs-face ((t (:background "grey25" :foreground "white"))))
 '(which-func ((((class color) (min-colors 88) (background dark)) (:foreground "#BED3E8"))))
 '(widget-field ((((type tty)) (:background "darkorange" :foreground "black"))))
 '(yard-param-name ((t (:weight bold))) t))

(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)
