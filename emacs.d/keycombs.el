(global-set-key (kbd "<home>") 'back-to-indentation)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-m") 'beginning-of-line)
(global-set-key (kbd "C-e") 'end-of-line)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-,") #'pop-tag-mark)

(global-set-key (kbd "M-Z") 'zap-between)
(global-set-key (kbd "M-o") 'dh-newline-before-this-line)
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "C-c y") 'djcb-duplicate-line)
(global-set-key (kbd "C-c c") (lambda()(interactive)(djcb-duplicate-line t)))
(global-set-key (kbd "s-i") 'indent-buffer)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "<f11>") 'magit-status)
(global-set-key (kbd "<Scroll_Lock>") '(lambda ()
                                         (interactive)
                                         (switch-to-buffer (other-buffer (current-buffer)))))

(global-set-key (kbd "C-x C-r") 'find-alternative-file-with-sudo)
(global-set-key (kbd "<f12>") '(lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (kbd "S-<Scroll_Lock>") 'revert-buffer)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)




(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
