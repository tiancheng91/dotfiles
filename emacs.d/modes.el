(display-time)
(delete-selection-mode t)
(scroll-bar-mode -1)
(show-paren-mode t)
(transient-mark-mode t)
(which-func-mode)
(epa-file-enable)
(when (fboundp 'winner-mode)
  (winner-mode 1))

(windmove-default-keybindings)

(recentf-mode 1)

(projectile-global-mode)
(elscreen-start)
(global-anzu-mode t)
(rich-minority-mode t)
(display-time-mode 0)
