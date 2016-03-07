(require 'ox)
(require 'ox-publish)

(org-export-define-backend 'trac
  '((headline . org-trac-headline)
    (paragraph . org-trac-paragraph)
    (item . org-trac-item)
    (section . org-trac-section)
    (plain-list . org-trac-plain-list)
    (src-block . org-trac-src-block)
    (quote-block . org-trac-quote-block)
    (table . org-trac-table)
    (table-row . org-trac-table-row)
    (table-cell . org-trac-table-cell)
    (link . org-trac-link)
    (bold . org-trac-bold)
    (italic . org-trac-italic)
    (strike-through . org-trac-strike-through)
    (underline . org-trac-underline)
    (timestamp . org-trac-timestamp)))


(defun org-trac-timestamp (timestamp contents info)
  (org-element-property :raw-value timestamp))

(defun org-trac-bold (bold contents info)
  (concat "'''" contents "'''"))

(defun org-trac-italic (italic contents info)
  (concat "''" contents "''"))

(defun org-trac-strike-through (strike-through contents info)
  (concat "~~" contents "~~"))

(defun org-trac-underline (underline contents info)
  (concat "__" contents "__"))

(defun org-trac-link (link desc info)
  (concat "[" (org-element-property :raw-link link) " " desc "]"))

(defun org-trac-table (table contents info)
  contents)

(defun org-trac-table-row (table-row contents info)
  (if (eq (org-element-property :type table-row) 'rule)
      contents
    (concat "|" contents "|")))

(defun org-trac-table-cell (table-cell contents info)
  (concat "|" contents "|"))

(defun org-trac-src-block (src-block contents info)
  (let ((content (org-element-property :value src-block)))
    (concat "{{{\n" content "}}}\n" contents)))

(defun org-trac-quote-block (quote-block contents info)
  (concat "  " (replace-regexp-in-string "\n" "\n  " contents)))

(defun org-trac-section (section contents info)
  contents)

(defun org-trac-item (item contents info)
  (let* ((parent (org-element-property :parent item))
	 (type (org-element-property :type parent)))
    (if (eq type 'ordered)
	(org-trac--item-ordered item contents info)
      (org-trac--item-unordered item contents info))))

(defun org-trac--item-level (item)
  (let ((parent item) (level 0))
    (while (memq (org-element-type
		  (setq parent (org-export-get-parent parent)))
		 '(plain-list item))
      (when (and (eq (org-element-type parent) 'plain-list)
		 (or
		  (eq (org-element-property :type parent)
		      'ordered)
		  (eq (org-element-property :type parent)
		      'unordered)))
	(incf level)))
    level))

(defun org-trac--item-unordered (item contents info)
  (let ((level (org-trac--item-level item))
	(res ""))
    (dotimes (val (- level 1)) (setq res (concat res " ")))
    (concat res "* " contents)))

(defun org-trac--item-ordered (item contents info)
  (let* ((level (org-trac--item-level item))
	 (trac-bullet (cond
		       ((eq level 1) "1")
		       ((eq level 2) "a")
		       ((eq level 3) "i")))
	 (res ""))
    (dotimes (val (- level 1)) (setq res (concat res "  ")))
    (concat res trac-bullet ". " contents)))

(defun org-trac-plain-list (plain-list contents info)
  contents)

(defun org-trac-headline (headline contents info)
  (let ((h (org-element-property :raw-value headline))
	(level (org-element-property :level headline))
	(result ""))
    (dotimes (val level) (set 'result (concat result "=")))
    (setq result (concat result " " h " "))
    (dotimes (val level) (set 'result (concat result "=")))
    (concat result "\n\n" contents)))

(defun org-trac-paragraph (paragraph contents info)
  (if (eq (org-element-type (org-export-get-parent paragraph)) 'item)
      (replace-regexp-in-string "\n" " " contents)
    contents))

(defun org-trac-export-as-trac
    (&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (org-export-to-buffer 'trac "*Org TRAC Export*"
    async subtreep visible-only body-only ext-plist (lambda () (text-mode))))

(provide 'ox-trac)

