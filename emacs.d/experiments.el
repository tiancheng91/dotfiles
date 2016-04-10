
;; (defun dh-chomp (str)
;;   "Chomp leading and tailing whitespace from STR."
;;   (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
;;                                     (: (* (any " \t\n")) eos)))
;;                             ""
;;                             str))
;;
;; (defun dh-default-selection (point)
;;   (save-excursion
;;     (goto-char point)
;;     (let (p1 p2)
;;       (save-excursion
;;         (re-search-backward "^\\|[[:space:]]")
;;         (setq p1 (point))
;;         (if (looking-at "[[:space:]]")
;;             (setq p1 (1+ p1))))
;;       (save-excursion
;;         (re-search-forward "$\\|[[:space:]]")
;;         (setq p2 (point))
;;         (if (looking-back "[[:space:]]")
;;             (setq p2 (1- p2))))
;;       (list p1 p2))))
;;       (dh-chomp (buffer-substring-no-properties p1 p2))

;; (global-set-key [mouse-3]	'dh-plumb)

;; (defun dh-plumb (click)
;;   ;; FIXME read string from buffer we clicked in
;;   ;; FIXME set the working directory
;;   ;; FIXME use 9p to write messages instead of shelling out
;;   (interactive "e")
;;   (let* ((pos (dh-default-selection (posn-point (event-start click))))
;;          (click (- (posn-point (event-start click)) (car pos)))
;;          (word (buffer-substring-no-properties (car pos) (nth 1 pos))))
;;     (message "echo '%s' | /opt/plan9/bin/plumb -a 'click=%d' -i" word click)
;;     (shell-command (format "/opt/plan9/bin/plumb -s acme -a 'click=%d' '%s'" click word))))


;; (defun dh-foo ()
;;   (dolist (el flycheck-current-errors nil)
;;     (go--goto-line (flycheck-error-line el))
;;     (end-of-line)
;;     (let ((ov (make-overlay (point) (progn (end-of-line) (point)) nil nil t)))
;;       (overlay-put ov 'dh-flycheck-overlay t)
;;       (overlay-put ov 'after-string
;;                    (concat (propertize "                  "
;;                                        'cursor t)
;;                            (propertize (flycheck-error-message el)
;;                                        'face 'dh-flycheck-overlay))))))




;; (defface dh-flycheck-overlay
;;   '((t (:background "light goldenrod" :foreground "black" :box (:line-width 1 :color "grey75" :style released-button))))
;;   "")
