;; xterm arrow keys
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5D" [C-left])
(define-key input-decode-map "\e[1;5C" [C-right])

(define-key input-decode-map "\e[1;2B" [S-down])
(define-key input-decode-map "\e[1;2A" [S-up])
;;; S-left and S-right are read from the terminfo

; (global-set-key (kbd "C-m") 'reindent-then-newline-and-indent)
(global-set-key (kbd "M-C-y") 'kill-ring-search)
(global-set-key (kbd "C-x ~") 'macro-math-eval-and-round-region)
(global-set-key (kbd "C-x =") 'macro-math-eval-region)

(global-set-key (kbd "<home>") 'back-to-indentation)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-m") 'beginning-of-line)
(global-set-key (kbd "C-e") 'end-of-line)

(global-set-key  [\M-delete] 'kill-word)
(global-set-key (kbd "s-i") 'indent-buffer)
(global-set-key (kbd "s-c") 'calculator)

(global-set-key (kbd "C-c j") 'semantic-ia-fast-jump)

(global-set-key (kbd "<f11>") 'magit-status)

(global-set-key (kbd "<f12>") '(lambda ()
                                 (interactive)
                                 (find-file "~/.emacs")))

(global-set-key (kbd "S-<Scroll_Lock>") 'revert-buffer)

(global-set-key (kbd "<Scroll_Lock>") '(lambda ()
                                         (interactive)
                                         (switch-to-buffer (other-buffer (current-buffer)))))


(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x C-r") 'find-alternative-file-with-sudo)

(global-set-key (kbd "C-;") 'iedit-mode)

;; duplicate a line
(global-set-key (kbd "C-c y") 'djcb-duplicate-line)

;; duplicate a line and comment the first
(global-set-key (kbd "C-c c") (lambda()(interactive)(djcb-duplicate-line t)))

(global-set-key (kbd "C-M-;") 'flycheck-previous-error)
(global-set-key (kbd "C-M-'")'flycheck-next-error)


(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-o") 'dh-newline-before-this-line)

(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))
(global-set-key (kbd "<f1>") 'deft)


(global-set-key (kbd "M-,") #'pop-tag-mark)

(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

(global-set-key (kbd "M-Z") 'zap-between)
