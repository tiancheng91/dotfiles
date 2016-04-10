(define-compilation-mode csearch-mode "Csearch"
  (set (make-local-variable 'next-error-highlight) nil))

(defun csearch (command-args)
  (interactive (list (read-shell-command "Run csearch (like this): "
                                         (concat "csearch -n "
                                                 (let ((root (condition-case nil (projectile-project-root) (error))))
                                                   (if root (concat "-f " root " "))))
                                                 'csearch-history)))
  (compilation-start command-args 'csearch-mode))
