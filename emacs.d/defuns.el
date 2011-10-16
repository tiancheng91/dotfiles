;; Like c-in-literal, only for Ruby
(defun ruby-in-literal ()
  (let* ((here (point))
         (state (save-excursion
                  (ruby-beginning-of-defun)
                  (parse-partial-sexp (point) here))))
    (or (nth 3 state)
        (nth 4 state)
        nil)))

;; Like c-electric-backspace, only for Ruby
(defun ruby-electric-backspace (arg)
  (interactive "*P")
  (if (or arg (ruby-in-literal))
      (backward-delete-char-untabify (prefix-numeric-value arg))
    (let ((here (point)))
      (skip-chars-backward " \t\n")
      (if (/= (point) here)
          (delete-region (point) here)
        (backward-delete-char-untabify 1)))))

(defun ruby-electric-delete (arg)
  (interactive "*P")
  (if (or arg (ruby-in-literal))
      (backward-delete-char-untabify (- (prefix-numeric-value arg)))
    (let ((here (point)))
      (skip-chars-forward " \t\n")
      (if (/= (point) here)
          (delete-region (point) here)
        (backward-delete-char-untabify -1)))))

(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun my-print-buffer ()
  (interactive)
  (if (y-or-n-p "Use postscript? ")
      (if (y-or-n-p "Use faces? ")
          (ps-print-buffer-with-faces)
        (progn
          (setq ps-print-color-p nil)
          (ps-print-buffer)
          (setq ps-print-color-p t)
          ))
    (print-buffer)))


(defun ruby-eval-buffer () (interactive)
  "Evaluate the buffer with ruby."
  (shell-command-on-region (point-min) (point-max) "ruby"))


(defun ruby-visit-source ()
  "If the current line contains text like '../src/program.rb:34', visit
that file in the other window and position point on that line."
  (interactive)
  (let* ((start-boundary (save-excursion (beginning-of-line) (point)))
         (regexp (concat "\\([ \t\n\r\"'([<{]\\|^\\)" ; non file chars or
                                        ; effective
                                        ; beginning of file
                         "\\(.+\\.rb\\):\\([0-9]+\\)")) ; file.rb:NNN
         (matchp (save-excursion
                   (end-of-line)
                   ;; if two matches on line, the second is most likely
                   ;; to be useful, so search backward.
                   (re-search-backward regexp start-boundary t))))
    (cond (matchp
           (let ((file (buffer-substring (match-beginning 2)
                                         (match-end 2)))
                 (line (buffer-substring (match-beginning 3)
                                         (match-end 3))))
                                        ; Windows: Find-file doesn't seem to work with Cygwin
                                        ; //<drive>/ format or the odd /cygdrive/<drive>/ format
             (if (or (string-match "//\\(.\\)\\(.*\\)" file)
                     (string-match "/cygdrive/\\(.\\)\\(.*\\)" file))
                 (setq file
                       (concat (substring file
                                          (match-beginning 1)
                                          (match-end 1))
                               ":"
                               (substring file
                                          (match-beginning 2)
                                          (match-end 2)))))

             (find-file-other-window file)
             (goto-line (string-to-number line))))
          (t
           (error "No ruby location on line.")))))



(defun unicode-shell ()
  "Execute the shell buffer in UTF-8 encoding.
Note that you'll need to set the environment variable LANG and others
appropriately."
  (interactive)
  (let ((coding-system-for-read 'utf-8)
        (coding-system-for-write 'utf-8)
        (coding-system-require-warning t))
    (call-interactively 'shell)))

(defun hcz-set-cursor-color-according-to-mode ()
  "change cursor color according to some minor modes."
  ;;set-cursor-color is somewhat costly, so we only call it when
  ;;needed:
  (let ((color
         (if buffer-read-only "yellow"
           (if overwrite-mode "red"
             "#95d8ff"))))
    (unless (and
             (string= color hcz-set-cursor-color-color)
             (string= (buffer-name) hcz-set-cursor-color-buffer))
      (set-cursor-color (setq hcz-set-cursor-color-color color))
      (setq hcz-set-cursor-color-buffer (buffer-name)))))

(defun My-smart-home ()
  "Odd home to beginning of line, even home to beginning of
text/code."
  (interactive)
  (if (and (eq last-command 'My-smart-home)
           (/= (line-beginning-position) (point)))
      (beginning-of-line)
    (beginning-of-line-text))
  )

(defun My-smart-end ()
  "Odd end to end of line, even end to begin of text/code."
  (interactive)
  (if (and (eq last-command 'My-smart-end)
           (= (line-end-position) (point)))
      (end-of-line-text)
    (end-of-line))
  )

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

(defun count-words-buffer ()
  "Count words in buffer"
  (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

(defun count-words-region ()
  "Count words in buffer"
  (interactive)
  (shell-command-on-region (point) (mark) "wc -w"))


(defun banexpire ()
  "Calculate timestamp for ban expire"
  (interactive)
  (setq my-t
        (time-to-seconds
         (apply 'encode-time
                (org-parse-time-string
                 (org-read-date)))))
  (if (< my-t (float-time))
      0
    (substring (number-to-string my-t) 0 -2)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun xmp (&optional option)
  "Run xmpfilter for annotation/test/spec."
  (interactive (rct-interactive))
  (rct-save-position
   (lambda () (shell-command-on-region (point-min) (point-max) (xmpfilter-command option) t t))))

(defun xmpfilter-command (&optional option)
  "The xmpfilter command line, DWIM."
  (setq option (or option ""))
  (cond ((save-excursion
           (goto-char 1)
           (search-forward "< Test::Unit::TestCase" nil t))
         (format "%s --unittest %s" xmpfilter-command-name option))
        ((save-excursion
           (goto-char 1)
           (re-search-forward "^context.+do$" nil t))
         (format "%s --spec %s" xmpfilter-command-name option))
        (t
         (format "%s %s" xmpfilter-command-name option))))


(defun ahkt-plot-table (script)
  "util function to export and plot a table using the supplied
gnuplot `script'"
  (org-table-export)
  (let ((cbuf (current-buffer))
        (cwin (selected-window)))
    (save-restriction
      (save-excursion
        (find-file script)
        (gnuplot-send-buffer-to-gnuplot)
        (bury-buffer)
        (bury-buffer (get-buffer "*gnuplot*"))))
    (and (window-live-p cwin) (select-window cwin))
    (switch-to-buffer cbuf)
    (delete-other-windows)))

(defun ruby-module-path(module)
  (shell-command-to-string
   (concat
    "ruby -e"
    "\"require 'rubygems'; ret='()';\\$LOAD_PATH.each{|p| "
    "x=p+'/'+ARGV[0].gsub('.rb', '')+'.rb';"
    "ret=File.expand_path(x)"
    "if(File.exist?(x))};printf ret\" "
    module)))

(defun etags-select-get-tag-files ()
  "Get tag files."
  (if etags-select-use-xemacs-etags-p
      (buffer-tag-table-list)
    (mapcar 'tags-expand-table-name tags-table-list)
    (tags-table-check-computed-list)
    tags-table-computed-list))

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

(defun my-ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
            (unless (integerp x)
              (push (prin1-to-string x t) tag-names)))
          tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))

(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1))

(defun my-c-mode-hook ()
   (setq c-cleanup-list (quote (empty-defun-braces brace-else-brace brace elseif-brace defun-close-semi list-close-comma scope-operator compact-empty-funcall comment-close-slash))))

(defun my-java-mode-hook ()
   (setq c-cleanup-list (quote (brace-else-brace empty-defun-braces defun-close-semi list-close-comma scope-operator compact-empty-funcall comment-close-slash))))


(defun find-alternative-file-with-sudo ()
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/su::"
             buffer-file-name))))
