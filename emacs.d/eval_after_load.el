(eval-after-load "ffap"
  '(push '(ruby-mode . ruby-module-path) ffap-alist))

(eval-after-load "add-log"
  '(progn
     (add-to-list 'change-log-version-number-regexp-list' "^# Version: \\([0-9]+.[0-9.]+\\)")
     (setq change-log-version-info-enabled t)))

(eval-after-load "flyspell-guess" '(flyspell-insinuate-guess-indicator))


(eval-after-load 'ruby-mode
  '(progn
     (global-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))


