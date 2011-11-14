(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\^h\^h" 'ruby-visit-source)
(global-set-key (quote [C-tab]) (quote other-window))
(global-set-key "d" (quote unicode-shell))
(global-set-key "\M-\C-y" 'kill-ring-search)
(global-set-key "\C-x~" 'macro-math-eval-and-round-region)
(global-set-key "\C-x=" 'macro-math-eval-region)
(global-set-key [home] 'My-smart-home)
(global-set-key [end] 'My-smart-end)

(global-set-key "\C-a" 'My-smart-home)
(global-set-key "\C-e" 'My-smart-end)

(global-set-key  [\M-delete] 'kill-word)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "s-i") 'indent-buffer)
(global-set-key (kbd "s-c") 'calculator)
;; (global-set-key (kbd "C-x C-b") 'ee-buffers)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

(global-set-key [menu] 'idomenu)

(global-set-key [f1] 'semantic-ia-show-summary)
(global-set-key (kbd "C-c j") 'semantic-ia-fast-jump)

(global-set-key [f2] '(lambda ()
                        (interactive)
                        (find-file "~/todo.org")))

(global-set-key [f5] '(lambda ()
                         (interactive)
                         (add-change-log-entry-other-window nil (find-changelog))))

(global-set-key [f11] 'magit-status)

(global-set-key [f12] '(lambda ()
                         (interactive)
                         (find-file "~/.emacs")))

(global-set-key [print] '(lambda ()
                           (interactive)
                           (my-print-buffer)))

(global-set-key [S-Scroll_Lock] '(lambda ()
                                   (interactive)
                                   (revert-buffer)))

(global-set-key [Scroll_Lock] '(lambda ()
                                 (interactive)
                                 (switch-to-buffer (other-buffer (current-buffer)))))


(global-set-key [pause] '(lambda ()
                           (interactive)
                           (ecb-toggle-ecb-windows)))
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)

(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key "\M-." 'etags-select-find-tag)
(global-set-key "\M-\C-g" 'org-plot/gnuplot)
(global-set-key (kbd "C-x C-r") 'find-alternative-file-with-sudo)
(global-set-key "\M-." 'my-ido-find-tag)
(define-key global-map "\C-cr" 'org-remember)
;; duplicate a line
(global-set-key (kbd "C-c y") 'djcb-duplicate-line)

;; duplicate a line and comment the first
(global-set-key (kbd "C-c c") (lambda()(interactive)(djcb-duplicate-line t)))

