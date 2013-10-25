;; xterm arrow keys
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5D" [C-left])
(define-key input-decode-map "\e[1;5C" [C-right])

(define-key input-decode-map "\e[1;2B" [S-down])
(define-key input-decode-map "\e[1;2A" [S-up])
;;; S-left and S-right are read from the terminfo



(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\^h\^h" 'ruby-visit-source)
(global-set-key (quote [C-tab]) (quote other-window))
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
(global-set-key [S-f6] 'idomenu)

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

(global-set-key [S-Scroll_Lock] 'revert-buffer)

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

(global-set-key "\M-\C-g" 'org-plot/gnuplot)
(global-set-key (kbd "C-x C-r") 'find-alternative-file-with-sudo)
(define-key global-map "\C-cr" 'org-remember)

(define-key global-map (kbd "C-;") 'iedit-mode)

;; duplicate a line
(global-set-key (kbd "C-c y") 'djcb-duplicate-line)

;; duplicate a line and comment the first
(global-set-key (kbd "C-c c") (lambda()(interactive)(djcb-duplicate-line t)))

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(global-set-key (kbd "C-M-;") 'flymake-goto-prev-error)
(global-set-key (kbd "C-M-'")'flymake-goto-next-error)
(global-set-key (kbd "C-x f") 'ido-choose-from-recentf)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "C-c f") 'flymake-display-current-error)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-o") 'dh-newline-before-this-line)
