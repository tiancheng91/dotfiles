(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun hcz-set-cursor-color-according-to-mode ()
  "change cursor color according to some minor modes."
  ;;set-cursor-color is somewhat costly, so we only call it when
  ;;needed:
  (let ((color
         (if buffer-read-only "yellow"
           (if overwrite-mode "red"
             "white"))))
    (unless (and
             (string= color hcz-set-cursor-color-color)
             (string= (buffer-name) hcz-set-cursor-color-buffer))
      (set-cursor-color (setq hcz-set-cursor-color-color color))
      (setq hcz-set-cursor-color-buffer (buffer-name)))))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun find-alternative-file-with-sudo ()
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/su::"
             buffer-file-name))))

(defun djcb-duplicate-line (&optional commentfirst)
  "comment line at point; if COMMENTFIRST is non-nil, comment the original"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (let ((str (buffer-substring (region-beginning) (region-end))))
    (when commentfirst
    (comment-region (region-beginning) (region-end)))
    (insert-string
      (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
    (forward-line -1)))

(defun djcb-snip (b e summ)
  "remove selected lines, and replace it with [snip:summary (n lines)]"
  (interactive "r\nsSummary:")
  (let ((n (count-lines b e)))
    (delete-region b e)
    (insert (format "[snip%s (%d line%s)]"
                    (if (= 0 (length summ)) "" (concat ": " summ))
                    n
                    (if (= 1 n) "" "s")))))

(defun dh-newline-before-this-line ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (funcall indent-line-function))

(defun dh-sprunge-buffer ()
  (interactive)
  (dh-sprunge-region (point-min) (point-max)))

(defun dh-sprunge-region (start end)
  "Send the region to the Playground and stores the resulting
link in the kill ring."
  (interactive "r")
  (let* ((url-request-method "POST")
         (url-request-extra-headers
          '(("Content-Type" . "application/x-www-form-urlencoded")))
         (url-request-data (concat "sprunge=" (url-hexify-string (buffer-substring-no-properties start end))))
         (content-buf (url-retrieve
                       "http://sprunge.us"
                       (lambda (arg)
                         (cond
                          ((equal :error (car arg))
                           (signal 'dh-sprunge-error (cdr arg)))
                          (t
                           (re-search-forward "\n\n")
                           (kill-new (buffer-substring (point) (point-max)))
                           (message "%s" (buffer-substring (point) (point-max)))))))))))

(defun zap-up-to-char (arg char)
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (read-char "Zap to char: " t)))
  (condition-case nil
      (progn
        (zap-to-char arg char)
        (insert-char char)
        (if (< 0 arg)
            (backward-char)))
    (error nil)))

(defun zap-between (char1 &optional char2)
  (interactive (list (read-char "Zap between: " t)))
  (setq char2 (or char2
                  (cdr (assoc char1
                              '((?< . ?>)
                                (?( . ?))
                                (?{ . ?})
                                (?[ . ?]))))
                  char1))
    (kill-region (save-excursion
                   (search-forward (char-to-string char1) nil nil -1)
                   (1+ (point)))
                 (save-excursion
                   (search-forward (char-to-string char2) nil nil 1)
                   (1- (point)))))

(defun me()
  (interactive)
  (insert "Dominik Honnef <dominik@honnef.co>"))
