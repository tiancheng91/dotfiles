(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "bsd")))
(setq c-basic-offset 2)

(defun my-c-mode-hook ()
  (setq comment-start "//"
        comment-end   ""
        c-basic-offset 4
        indent-tabs-mode t
        c-backspace-function 'delete-backward-char)
  (c-set-offset 'arglist-cont-nonempty '++))

(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))


(defun new-c-lineup-arglist (langelem)
  (save-excursion
    (goto-char (cdr langelem))
    (setq syntax (car (car (c-guess-basic-syntax))))
    (while (or (eq syntax 'arglist-intro)
               (or (eq syntax 'arglist-cont)
                   (eq syntax 'arglist-cont-nonempty)))
      (forward-line -1)
      (setq syntax (car (car (c-guess-basic-syntax)))))
    (beginning-of-line)
    (re-search-forward "[^ \t]" (c-point 'eol))
    (goto-char (+ (match-beginning 0) 4))
    (vector (current-column))))

(c-add-style "openbsd"
             '("bsd"
               (c-ignore-auto-fill . '(string))
               (c-subword-mode . 0)
               (c-basic-offset . 8)
               (c-label-minimum-indentation . 0)
               (c-offsets-alist .
                                ((arglist-intro . new-c-lineup-arglist)
                                 (arglist-cont . new-c-lineup-arglist)
                                 (arglist-cont-nonempty . new-c-lineup-arglist)
                                 (arglist-close . 0)
                                 (substatement-open . 0)
                                 (statement-cont . *)
                                 (case-label . 0)
                                 (knr-argdecl . *)))
               (fill-column . 80)
               (tab-width . 8)
               (indent-tabs-mode . t)))


(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
(add-hook 'c-mode-hook 'my-c-mode-hook)
