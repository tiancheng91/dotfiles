;;;;Keep cursor's pos while using pgup/down
(defadvice scroll-up (around ewd-scroll-up first act)
  "Keep cursor in the same column."
  (let ((col (current-column)))
    ad-do-it
    (move-to-column col)))

(defadvice scroll-down (around ewd-scroll-down first act)
  "Keep cursor in the same column."
  (let ((col (current-column)))
    ad-do-it
    (move-to-column col)))

(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
    (setq header-line-format which-func-header-line-format)))


(defadvice ps-print-buffer-with-faces (around ps-print-buffer-with-faces-arround)
  "Change colortheme to black on white for printing and back afterwards"
  (let ((oldfg (frame-parameter (selected-frame) 'foreground-color))
        (oldbg (frame-parameter (selected-frame) 'background-color)))

    (set-background-color "White")
    (set-foreground-color "Black")

    (unwind-protect
        ad-do-it

      (set-background-color oldbg)
      (set-foreground-color oldfg))))
