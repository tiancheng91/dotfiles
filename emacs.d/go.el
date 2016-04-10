(add-to-list 'load-path "~/prj/src/golang.org/x/tools/cmd/guru")
(add-to-list 'load-path "~/prj/src/golang.org/x/tools/refactor/rename")
(add-to-list 'load-path "~/prj/src/github.com/tv42/where")

(defun my-go-mode-hook ()
  (add-to-list (make-local-variable 'company-backends) (list 'company-go 'company-dabbrev))
  (add-hook 'before-save-hook 'gofmt-before-save nil t)
  (go-eldoc-setup)
  (go-guru-hl-identifier-mode)
  (subword-mode 1))


(defun go-instrument-returns ()
  (interactive)
  (save-excursion
    (save-restriction
      (let ((cnt 0))
        (narrow-to-defun)
        (beginning-of-defun)
        (while (re-search-forward "^[[:space:]]+return")
          (setq cnt (1+ cnt))
          (beginning-of-line)
          (open-line 1)
          (funcall indent-line-function)
          (insert (format "log.Println(\"return statement %d\") /* RETURN INSTRUMENT */" cnt))
          (forward-line 2))))))

(defun go-deinstrument-returns ()
  (interactive)
  (save-excursion
    (save-restriction
      (narrow-to-defun)
      (beginning-of-defun)
      (while (re-search-forward "^.+/\\* RETURN INSTRUMENT \\*/\n" nil t)
        (replace-match "" nil nil)))))

(defun dh-go-current-import-path ()
  ;; +4 for src/
  ;; Note: only works with a single gopath
  (let ((dir (file-name-directory (file-truename buffer-file-name))))
    (substring dir (+ 4 (length (file-truename (getenv "GOPATH")))) (1- (length dir)))))

(defun go-test ()
  (interactive)
  (compile "go test -coverprofile=c.out"))

(defun dh-go-coverage ()
  (interactive)
  (shell-command "go test -coverprofile=c.out")
  (go-coverage "c.out"))

(defun go ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

(defun golint ()
  "golint the current buffer"
  (interactive)
  (compile (concat "golint " (buffer-file-name))))

(defun govet ()
  "go vet the current buffer"
  (interactive)
  (compile (concat "go vet " (buffer-file-name))))

(defun go-find (name)
  (interactive "MIdentifier: ")
  (godef--find-file-line-column (shell-command-to-string (format "go-find %s" name)) nil))


(defun go-link ()
  "Create a golang.org/src/ link for the current file, line
number and optionally the region. If the Go version is not a
release version, tip.golang.org will be used instead."
  (interactive)
  (let* ((goroot (file-truename (car (go-root-and-paths))))
         (path (file-truename (buffer-file-name)))
         (base (if (go--string-prefix-p "go version devel" (shell-command-to-string (concat go-command " version")))
                   "tip.golang.org"
                 "golang.org"))
         (line (line-number-at-pos))
         (start (if (use-region-p)
                    (1- (region-beginning))
                  0))
         (end (if (use-region-p)
                  (1- (region-end))
                0))
         (url (concat "http://" base (substring path (length goroot)) (format"?s=%d:%d#L%d" start end line))))
    (when (called-interactively-p 'any)
      (deactivate-mark)
      (kill-new url)
      (message "%s" url))
    url))

;; Turn
;;
;;   T{foo: bar, baz: qux{}}
;;
;; into
;;
;;   T{
;;   	foo: bar,
;;   	baz: qux{},
;;   }
;;
;; Point needs to be anywhere before, or on, the opening {
(defun go-neat-struct ()
  (interactive)
  (save-excursion
    (search-forward "{")
    (let ((start-level (go-paren-level))
          (start-pos (point)))
      (reindent-then-newline-and-indent)
      (while (and (>= (go-paren-level) start-level)
                  (search-forward "," nil t))
        (if (= (go-paren-level) start-level)
            (reindent-then-newline-and-indent)))
      (goto-char (1- start-pos))
      (forward-list)
      (backward-char)
      (insert ",")
      (reindent-then-newline-and-indent))))

(defun go-peek ()
  (interactive)
  (let ((file (car (godef--call (point))))
        code)
    (string-match "\\(.+\\):\\([0-9]+\\):\\([0-9]+\\)" file)
    (let ((filename (match-string 1 file))
          (line (string-to-number (match-string 2 file)))
          (column (string-to-number (match-string 3 file))))
      (with-current-buffer (find-file-noselect filename)
        (save-excursion
          (go--goto-line line)
          (beginning-of-line)
          (forward-char (1- column))
          (mark-defun)
          (setq code (buffer-substring (region-beginning) (region-end)))))
      (display-message-or-buffer code))))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(eval-after-load 'go-mode
  (lambda ()
    (require 'company)
    (require 'go-eldoc)
    (require 'go-errcheck)
    (require 'company-go)
    (require 'go-where)
    (require 'go-rename)
    (require 'go-guru)

    (define-key go-mode-map (kbd "C-c C-r") #'go-remove-unused-imports)
    (define-key go-mode-map (kbd "M-.") (lambda () (interactive) (godef-jump (point) current-prefix-arg)))
    (define-key go-mode-map (kbd "C-c d") #'godoc-at-point)
    (define-key go-mode-map (kbd "C-c i") #'go-impl)
    (define-key go-mode-map (kbd "C-=") #'go-guru-expand-region)
    (define-key go-mode-map (kbd "<f1>") #'go-peek)))

(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets_go")
