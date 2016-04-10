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

(defun end-of-line-text ()
  "Move to end of current line and skip comments and trailing space.
Require `font-lock'."
  (interactive)
  (end-of-line)
  (let ((bol (line-beginning-position)))
    (unless (eq font-lock-comment-face (get-text-property bol 'face))
      (while (and (/= bol (point))
                  (eq font-lock-comment-face
                      (get-text-property (point) 'face)))
        (backward-char 1))
      (unless (= (point) bol)
        (forward-char 1) (skip-chars-backward " \t\n"))))
  ) ;;;;Done with home and end keys.

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

(defun find-changelog ()
  (let (last_filename cur_filename found_filename)
    (setq last_filename nil)
    (setq cur_filename  "")
    (setq found_filename nil)
    (setq iteration 1)
    (while (not (or
                 (equal last_filename
                        (setq cur_filename
                              (file-truename
                               (concat (buffer-file-name)
                                       (mapconcat 'identity (make-list iteration "/..") "")
                                       "/ChangeLog"))))
                 found_filename))
      (if (file-exists-p cur_filename)
          (setq found_filename cur_filename))
      (setq last_filename cur_filename)
      (setq iteration (+ iteration 1)))
    found_filename))

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

(defun w3m-copy-url-at-point ()
    (interactive)
    (let ((url (w3m-anchor)))
      (if (w3m-url-valid url)
      (kill-new (w3m-anchor))
        (message "No URL at point!"))))

(defun ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
    (find-file
     (ido-completing-read "Recentf open: "
                          (mapcar (lambda (path)
                                    (replace-regexp-in-string home "~" path))
                                  recentf-list)
                          nil t))))

(defun djcb-snip (b e summ)
  "remove selected lines, and replace it with [snip:summary (n lines)]"
  (interactive "r\nsSummary:")
  (let ((n (count-lines b e)))
    (delete-region b e)
    (insert (format "[snip%s (%d line%s)]"
                    (if (= 0 (length summ)) "" (concat ": " summ))
                    n
                    (if (= 1 n) "" "s")))))

(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))

(defun gnus-goto-google ()
  (interactive)
  (when (memq major-mode '(gnus-summary-mode gnus-article-mode))
    (when (eq major-mode 'gnus-article-mode)
      (gnus-article-show-summary))
    (let* ((article (gnus-summary-article-number))
           (header (gnus-summary-article-header article))
           (id (substring (mail-header-id header) 1 -1)))
      (kill-new
       (format "http://groups.google.com/groups?selm=%s" id)))))


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

(defun dh-open-temp-file (suffix)
  (interactive "MFile suffix: ")
  (let ((tmp (make-temp-file nil nil (concat "." suffix))))
    (with-current-buffer (find-file tmp)
      (insert tmp)
      (comment-region (point-min) (point-max))
      (end-of-line)
      (newline))))

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

