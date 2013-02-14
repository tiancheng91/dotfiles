(display-time)
(global-hl-line-mode 1)
(global-glasses-mode t)
(global-linum-mode t)
(global-gtags-mode t)
(delete-selection-mode t)
(ido-mode 1)
(scroll-bar-mode -1)
(show-paren-mode t)
(transient-mark-mode t)
(template-initialize)
(which-func-mode)
(epa-file-enable)
(when (fboundp 'winner-mode)
  (winner-mode 1))

(ruby-block-mode t)

(windmove-default-keybindings)
(org-remember-insinuate)
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-gnus)

(recentf-mode 1)

(global-ede-mode 1)
(semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(global-semantic-idle-summary-mode -1)
(global-srecode-minor-mode 1)
(global-semantic-idle-completions-mode)
(semantic-toggle-decoration-style 'semantic-tag-boundary 0)

(yas-global-mode 1)

(global-highlight-parentheses-mode 1)
