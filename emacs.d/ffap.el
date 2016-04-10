(require 'ffap)

(defvar ffap-file-at-point-line-number nil
  "Variable to hold line number from the last `ffap-file-at-point' call.")
(defvar ffap-file-at-point-col-number nil
  "Variable to hold column number from the last `ffap-file-at-point' call.")

(defadvice ffap-file-at-point (after ffap-store-line-number activate)
  "Search `ffap-string-at-point' for a line number pattern and
save it in `ffap-file-at-point-line-number' variable."
  (let* ((string (ffap-string-at-point)) ;; string/name definition copied from `ffap-string-at-point'
         (name
          (or (condition-case nil
                  (and (not (string-match "//" string)) ; foo.com://bar
                       (substitute-in-file-name string))
                (error nil))
              string))
         (matched (and
                   (string-match ":\\([0-9]+\\)\\(?::\\([0-9]+\\)\\)?$" name)
                   (list (match-string 1 name) (match-string 2 name))))
         (line-number
          (and matched
               (string-to-number (nth 0 matched))))
         (col-number
          (and matched
               (nth 1 matched)
               (string-to-number (nth 1 matched)))))
    (if (and line-number (> line-number 0))
        (setq ffap-file-at-point-line-number line-number)
      (setq ffap-file-at-point-line-number nil))
    (if col-number
        (setq ffap-file-at-point-col-number col-number)
      (setq ffap-file-at-point-col-number nil))))

(defadvice find-file-at-point (after ffap-goto-line-number activate)
  "If `ffap-file-at-point-line-number' is non-nil goto this line."
  (when ffap-file-at-point-line-number
    (goto-line ffap-file-at-point-line-number)
    (setq ffap-file-at-point-line-number nil))
  (when ffap-file-at-point-col-number
    (forward-char (1- ffap-file-at-point-col-number))
    (setq ffap-file-at-point-col-number nil)))
