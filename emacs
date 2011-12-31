;; -*- mode: emacs-lisp -*-
(setq warning-suppress-types nil)

;; -*- mode: emacs-lisp -*-
;;;; Appearance of Emacs - Load this at first so the startup doesnt look that ugly
(load "~/.emacs.d/appearance")

;;;; Own defuns
(load "~/.emacs.d/defuns")

;;;; Load paths
(load "~/.emacs.d/loadpaths")

;;;; Requires/loads
(load "~/.emacs.d/loads")

;;;; Autoloads
(load "~/.emacs.d/autoloads")

;;;; Hooks
(load "~/.emacs.d/hooks")

;;;; Global minor-modes
(define-globalized-minor-mode global-glasses-mode glasses-mode glasses-mode)

;;;; Variables/Options
(load "~/.emacs.d/variables")

;;;Change backup behavior to save in a directory, not in a miscellany
;;;of files all over the place.
(load "~/.emacs.d/backup")

;;;; Modes
(load "~/.emacs.d/modes")
(set-face-background 'hl-line "#333")

;;;; auto-modes
(load "~/.emacs.d/automodes")

;;;; utf8
(load "~/.emacs.d/utf8")

;;;; Advices
(load "~/.emacs.d/advices")

;;;; Support for YARD tags
(load "~/.emacs.d/yard")

;;;; Key combinations
(load "~/.emacs.d/keycombs")

;;;; TRAMP
(load "~/.emacs.d/tramp_config")

;;;; yasnippet
(load "~/.emacs.d/yasnippet_config")

;;;; Passwords
(load "~/.emacs.d/passwords")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-default-position "h")
 '(LaTeX-default-style "scrartcl")
 '(LaTeX-document-regexp "document\\|Artikel")
 '(LaTeX-float "h")
 '(LaTeX-indent-environment-list (quote (("shell" current-indentation) ("lstlisting" current-indentation) ("ListingUmg" current-indentation) ("ListingUmgS" current-indentation) ("BefehlUmgS" current-indentation) ("BefehlUmg" current-indentation) ("verbatim" current-indentation) ("verbatim*" current-indentation) ("array") ("displaymath") ("eqnarray") ("eqnarray*") ("equation") ("equation*") ("picture") ("tabbing") ("table") ("table*") ("tabular") ("tabular*") ("enumerate"))))
 '(LaTeX-item-indent 1)
 '(LaTeX-verbatim-regexp "verbatim\\*?\\|ListingUmg\\|BefehlUmg")
 '(TeX-newline-function (quote reindent-then-newline-and-indent))
 '(add-log-file-name-function nil)
 '(autotest-use-ui t)
 '(blink-cursor-mode nil)
 '(c-hanging-semi&comma-criteria (quote (c-semi&comma-no-newlines-before-nonblanks c-semi&comma-inside-parenlist)))
 '(change-log-default-name nil)
 '(css-color-global-mode t)
 '(css-electric-brace-behavior t)
 '(css-electric-semi-behavior t)
 '(css-indent-offset 2)
 '(flymake-no-changes-timeout 10)
 '(font-latex-fontify-script nil)
 '(font-latex-fontify-sectioning 1.1)
 '(font-latex-match-sectioning-3-keywords (quote (("Absch" ""))))
 '(font-latex-match-sectioning-4-keywords (quote (("UAbsch" ""))))
 '(gimp-exe "gimp")
 '(glasses-separator "")
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-hl-line-mode t)
 '(global-semantic-highlight-edits-mode nil nil (semantic-util-modes))
 '(global-semantic-idle-completions-mode nil nil (semantic-idle))
 '(global-whitespace-mode t)
 '(haml-backspace-backdents-nesting t)
 '(ido-enable-flex-matching t)
 '(ido-enable-regexp nil)
 '(ido-everywhere t)
 '(ido-ignore-buffers (quote ("\\` " "\\*tramp/.+")))
 '(ido-mode (quote both) nil (ido))
 '(ido-unc-hosts nil)
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-url-at-point t)
 '(imaxima-bg-color "black")
 '(imaxima-fg-color "white")
 '(imaxima-fnt-size "huge")
 '(imaxima-image-type (quote png))
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 600000)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-cleanup-whitespace t)
 '(js2-enter-indents-newline t)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key t)
 '(lpr-headers-switches nil)
 '(lpr-page-header-program "pr")
 '(lpr-page-header-switches (quote ("-h" "%s" "-F" "-o 5")))
 '(magit-log-cutoff-length -1)
 '(magit-process-popup-time 5)
 '(magit-save-some-buffers nil)
 '(mumamo-chunk-coloring 999)
 '(mumamo-set-major-mode-delay -1)
 '(nxhtml-default-encoding (quote utf-8))
 '(nxhtml-skip-welcome t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files (quote ("~/notes/private.org" "~/notes/university.org" "~/notes/projects/cinch.org")))
 '(org-descriptive-links t)
 '(org-ellipsis (quote org-warning))
 '(org-startup-folded nil)
 '(org-startup-truncated nil)
 '(org-tab-follows-link t)
 '(php-basic-offset 2)
 '(php-speedbar-config nil)
 '(popcmp-group-alternatives nil)
 '(post-email-address "dominikh@fork-bomb.org")
 '(post-jump-header t)
 '(post-kill-quoted-sig t)
 '(pr-print-using-ghostscript nil)
 '(ps-always-build-face-reference t)
 '(ps-paper-type (quote a4))
 '(require-final-newline t)
 '(ruby-block-delay 0.1)
 '(ruby-deep-arglist 1)
 '(ruby-electric-expand-delimiters-list nil)
 '(safe-local-variable-values (quote ((TeX-brace-indent-level . 2) (LaTeX-indent-level . 2) (TeX-brace-indent-level . 0) (TeX-brace-indent-level) (LaTeX-indent-level . 0) (whitespace-action auto-cleanup) (whitespace-action quote (auto-cleanup)) (Coding . iso-2022-7bit) (whitespace-action) (encoding . utf-8))))
 '(semantic-idle-scheduler-idle-time 1)
 '(semantic-idle-scheduler-working-in-modeline-flag t)
 '(standard-indent 2)
 '(tab-width 4)
 '(tramp-encoding-shell "/bin/bash")
 '(user-full-name "Dominik Honnef")
 '(vc-follow-symlinks t)
 '(w3-use-terminal-characters t)
 '(w3m-default-display-inline-images t)
 '(which-func-modes (quote (emacs-lisp-mode c-mode c++-mode perl-mode cperl-mode python-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode diff-mode ruby-mode)))
 '(which-function-mode t)
 '(whitespace-action (quote (auto-cleanup)))
 '(whitespace-modes (quote (ada-mode asm-mode autoconf-mode awk-mode c-mode c++-mode cc-mode change-log-mode cperl-mode electric-nroff-mode emacs-lisp-mode f90-mode fortran-mode html-mode html3-mode java-mode jde-mode ksh-mode latex-mode LaTeX-mode lisp-mode m4-mode makefile-mode modula-2-mode nroff-mode objc-mode pascal-mode perl-mode prolog-mode python-mode scheme-mode sgml-mode sh-mode shell-script-mode simula-mode tcl-mode tex-mode texinfo-mode vrml-mode xml-mode ruby-mode)))
 '(whitespace-style (quote (trailing space-before-tab space-after-tab)))
 '(woman-use-own-frame nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(diff-added ((t (:inherit diff-changed :foreground "green"))))
 '(diff-changed ((nil nil)))
 '(diff-removed ((t (:inherit diff-changed :foreground "red"))))
 '(fg:erc-color-face1 ((t (:foreground "white"))))
 '(flymake-errline ((((class color) (background dark)) (:background "#650000"))))
 '(font-lock-yard-face ((t nil)) t)
 '(gnus-button ((t (:weight bold))))
 '(gnus-group-mail-3 ((((class color) (background dark)) (:foreground "#82b0db" :weight bold))))
 '(gnus-group-mail-3-empty ((((class color) (background dark)) (:foreground "#82b0db"))))
 '(gnus-header-content ((t (:foreground "green" :slant italic))))
 '(gnus-header-from ((((class color) (background dark)) (:foreground "green"))))
 '(gnus-header-name ((((class color) (background dark)) (:foreground "Red" :weight bold))))
 '(gnus-header-subject ((((class color) (background dark)) (:foreground "green"))))
 '(gnus-signature ((t (:foreground "green" :slant italic))))
 '(gnus-summary-normal-ancient ((((class color) (background dark)) (:foreground "gray50"))))
 '(gnus-summary-normal-read ((((class color) (background dark)) (:foreground "#757575"))))
 '(gnus-summary-normal-ticked ((((class color) (background dark)) (:foreground "red"))))
 '(gnus-summary-normal-unread ((t (:foreground "#82b0db"))))
 '(gnus-summary-selected ((t nil)))
 '(linum ((t (:inherit shadow :background "grey10" :foreground "orange" :weight ultra-bold :height 0.8))))
 '(magit-diff-add ((((class color) (background dark)) (:foreground "green"))))
 '(magit-diff-file-header ((t (:inherit magit-header :background "dim grey"))))
 '(magit-diff-hunk-header ((t (:inherit magit-header :background "dim grey" :slant italic))))
 '(magit-item-highlight ((((class color) (background dark)) nil)))
 '(message-header-cc ((t (:foreground "Orange"))))
 '(message-header-newsgroups ((t (:foreground "orange" :slant italic :weight bold))))
 '(message-header-other ((t (:foreground "orange"))))
 '(message-header-subject ((t (:foreground "orange" :weight bold))))
 '(message-header-to ((t (:foreground "Orange" :weight bold))))
 '(message-header-xheader ((t (:foreground "orange"))))
 '(mode-line ((((class color) (min-colors 88)) (:background "brightblack" :foreground "white" :box -1))))
 '(mode-line-inactive ((t (:inherit mode-line :background "black" :foreground "white" :box (:line-width -1 :color "grey40") :weight light))))
 '(org-checkbox ((t (:inherit bold))))
 '(tabs-current ((t (:inherit tabs-face :background "grey40"))))
 '(tabs-face ((t (:background "grey25" :foreground "white"))))
 '(which-func ((((class color) (min-colors 88) (background dark)) (:foreground "Orange1"))))
 '(widget-field ((((type tty)) (:background "darkorange" :foreground "black"))))
 '(yard-param-name ((t (:weight bold))) t))

(server-start)

;; (require 'gnus-load)

(setq gnus-inhibit-startup-message t)

(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))

(yas/advise-indent-function 'ruby-indent-command)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(setq show-trailing-whitespace t)
(setq warning-minimum-level :error)

(require 'semantic-gcc)
(global-ede-mode 1)
(semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(global-semantic-idle-summary-mode -1)
(global-srecode-minor-mode 1)
(global-semantic-idle-completions-mode)
(semantic-toggle-decoration-style 'semantic-tag-boundary 0)

(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (setq edit-server-new-frame nil)
      (edit-server-start)))
