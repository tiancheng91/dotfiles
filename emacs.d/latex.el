(defun my-LaTeX-mode-hook ()
  (add-to-list 'font-latex-match-sectioning-2-keywords-local "Absch")
  (font-latex-match-sectioning-2-make)
  (turn-on-reftex))

(setq TeX-auto-save t)
(setq TeX-close-quote "\"'")
(setq TeX-open-quote "\"`")
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
