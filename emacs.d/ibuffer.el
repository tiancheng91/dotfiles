(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("c/c++" (or
                         (mode . c-mode)
                         (mode . c++-mode)))
               ("el" (mode . emacs-lisp-mode))
               ("perl" (mode . cperl-mode))
               ("ruby" (mode . ruby-mode))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("magit" (name . "^\\*magit.*$"))))))

(defun my-ibuffer-mode-hook ()
  (ibuffer-switch-to-saved-filter-groups "default"))

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))
(add-hook 'ibuffer-mode-hook 'my-ibuffer-mode-hook)

(global-set-key (kbd "C-x C-b") 'ibuffer)
