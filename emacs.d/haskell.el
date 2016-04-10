(defun my-haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation))

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(add-auto-mode 'haskell-mode "\\.hs$")
