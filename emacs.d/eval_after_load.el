(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files "~/.emacs.d/contrib/html5-el/schemas.xml"))

(eval-after-load 'yasnippet
  '(progn
     (define-key yas-minor-mode-map (kbd "<tab>") nil)
     (define-key yas-minor-mode-map (kbd "TAB") nil)
     (define-key yas-minor-mode-map (kbd "M-TAB") 'yas-expand)))
