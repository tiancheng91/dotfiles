(display-time)
(global-hl-line-mode 1)
(global-glasses-mode t)
(global-linum-mode t)
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

(windmove-default-keybindings)
(org-remember-insinuate)
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-gnus)

(recentf-mode 1)

(semantic-mode 1)
(global-ede-mode 1)


(yas-global-mode 1)

(global-highlight-parentheses-mode 1)
