(eval-after-load 'go-mode
  '(progn
     (define-key go-mode-map (kbd "C-c C-r") 'go-remove-unused-imports)
     (define-key go-mode-map (kbd "M-.") (lambda () (interactive) (godef-jump (point) current-prefix-arg)))
     (define-key go-mode-map (kbd "C-c d") 'godoc-at-point)
     (define-key go-mode-map (kbd "C-c i") #'go-impl)
     (define-key go-mode-map (kbd "C-=") #'go-guru-expand-region)))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-c C-a")  'xmp)
     (define-key ruby-mode-map (kbd "C-c C-e")  'xmp)))

(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files "~/.emacs.d/contrib/html5-el/schemas.xml"))
