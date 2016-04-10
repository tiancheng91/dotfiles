;; Like c-in-literal, only for Ruby
(defun ruby-in-literal ()
  (let* ((here (point))
         (state (save-excursion
                  (ruby-beginning-of-defun)
                  (parse-partial-sexp (point) here))))
    (or (nth 3 state)
        (nth 4 state)
        nil)))

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

(defun ruby-module-path(module)
  (shell-command-to-string
   (concat
    "ruby -e"
    "\"require 'rubygems'; ret='()';\\$LOAD_PATH.each{|p| "
    "x=p+'/'+ARGV[0].gsub('.rb', '')+'.rb';"
    "ret=File.expand_path(x)"
    "if(File.exist?(x))};printf ret\" "
    module)))

(defun xmp (&optional option)
  "Run xmpfilter for annotation/test/spec."
  (require 'rcodetools)
  (interactive)
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

(defun my-ruby-mode-hook ()
  (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
  (set (make-local-variable 'indent-tabs-mode) 'nil)
  (set (make-local-variable 'tab-width) 2)
  (imenu-add-to-menubar "IMENU")
  (define-key help-map "r" 'ri))

(defun my-ruby-align-load-hook ()
  (add-to-list 'align-rules-list
               '(ruby-comma-delimiter
                 (regexp . ",\\(\\s-*\\)[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))
  (add-to-list 'align-rules-list
               '(ruby-hash-literal
                 (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))
  (add-to-list 'align-rules-list
               '(ruby-assignment-literal
                 (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))
  (add-to-list 'align-rules-list
               '(ruby-xmpfilter-mark
                 (regexp . "\\(\\s-*\\)# => [^#\t\n]")
                 (repeat . nil)
                 (modes  . '(ruby-mode)))))

(add-hook 'align-load-hook 'my-ruby-align-load-hook)
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-c C-a")  'xmp)
     (define-key ruby-mode-map (kbd "C-c C-e")  'xmp)))

(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(autoload 'ri "ri-ruby" nil t)
(autoload 'ri-ruby-complete-symbol "ri-ruby" nil t)
(autoload 'ruby-mode "ruby-mode" nil t)
(autoload 'run-ruby "inf-ruby" nil t)

(add-auto-mode 'ruby-mode "\\.gemspec$")
(add-auto-mode 'ruby-mode "\\.rb$")
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby1.8" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby1.9" . ruby-mode))
