(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))


(eval-after-load 'go-mode
  '(progn
     (define-key go-mode-map (kbd "C-c C-r") 'go-remove-unused-imports)
     (define-key go-mode-map (kbd "M-.") (lambda () (interactive) (godef-jump (point) current-prefix-arg)))))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map [backspace] 'ruby-electric-backspace)
     (define-key ruby-mode-map [delete]    'ruby-electric-delete)
     (define-key ruby-mode-map (kbd "C-c C-a")  'xmp)
     (define-key ruby-mode-map (kbd "C-c C-e")  'xmp)))

(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files "~/.emacs.d/contrib/html5-el/schemas.xml"))
