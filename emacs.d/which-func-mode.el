(setq which-func-header-line-format ;; FIXME unknown variable
      '(which-func-mode
        ("" which-func-format
         )))

(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
    (setq header-line-format which-func-header-line-format)))
