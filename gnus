(setq gnus-select-method
      '(nntp "news.gmane.org"))


(setq gnus-secondary-select-methods
      '((nnimap "fork-bomb" ; primary email
                (nnimap-address "mail.fork-bomb.org")
                (nnimap-server-port 993)
                (nnimap-authenticator login)
                (nnimap-expunge-on-close 'never)
                (nnimap-stream ssl))))

(setq gnus-asynchronous t)

(setq gnus-use-demon nil)
(gnus-demon-add-handler 'gnus-demon-scan-and-update 1 nil)
(gnus-demon-init)
(gnus-compile)


(require 'pgg)
(setq pgg-passphrase-cache-expiry 300)

;; Buttonize the different parts, please
(setq gnus-buttonized-mime-types '("multipart/encrypted" "multipart/signed"))

;; But keep buttons for multiple parts
(setq gnus-inhibit-mime-unbuttonizing t)

(setq gnus-visible-headers
      '("^From:" "^Subject:" "^To:" "^Cc:" "^Resent-To:" "^Message-ID:"
        "^Date:" "^X-Sent:" "^Newsgroups:" "^Organization:" "Followup-To:"
        "Reply-To:" "^X-Newsreader:" "^X-Mailer:"
        "X-Mail-Count" "User-Agent"
        "X-Spam-Status" "^X-Spam-Level:" "Archived-At"))

(add-to-list 'mm-discouraged-alternatives "text/html")
(add-to-list 'mm-discouraged-alternatives "image/")
(add-to-list 'mm-discouraged-alternatives "multipart/related")

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-message-archive-group nil)
(setq gnus-gcc-mark-as-read t)


(setq gnus-summary-display-arrow t)



(defun gnus-user-format-function-@ (header)
  "Display @ for message with attachment in summary line.

You need to add `Content-Type' to `nnmail-extra-headers' and
`gnus-extra-headers', see Info node `(gnus)To From Newsgroups'."
  (let ((case-fold-search t)
        (ctype (or (cdr (assq 'Content-Type (mail-header-extra header)))
                   "text/plain"))
        indicator)
    (when (string-match "^multipart/mixed" ctype)
      (setq indicator "@"))
    (if indicator
        indicator
      " ")))


;;; threading
(setq gnus-face-9 'font-lock-warning-face)
(setq gnus-face-10 'shadow)

(defun sdl-gnus-summary-line-format-unicode nil
  (interactive)
  (setq gnus-summary-line-format
        (concat
         "%0{%U%R%z%}" "%10{│%}" "%1{%&user-date;%}" "%10{│%}"
         "%9{%u&@;%}" "%(%-20,20f %)" "%10{│%}" "%4k" "%10{│%}"
         "%10{%B%}" "%s\n"))
  (setq
   gnus-sum-thread-tree-single-indent   "◎ "
   gnus-sum-thread-tree-false-root      "  "
   gnus-sum-thread-tree-root            "┌ "
   gnus-sum-thread-tree-vertical        "│"
   gnus-sum-thread-tree-leaf-with-other "├─>"
   gnus-sum-thread-tree-single-leaf     "└─>"
   gnus-sum-thread-tree-indent          "  "))

(sdl-gnus-summary-line-format-unicode)

(setq gnus-user-date-format-alist
      '((t . "%Y-%m-%d %T")))

;; (setq gnus-fetch-old-headers t)
(setq gnus-article-sort-functions 'gnus-article-sort-by-date)
(setq gnus-build-sparse-threads nil)
(setq gnus-summary-display-while-building nil)
(setq gnus-summary-make-false-root t)

(setq gnus-summary-gather-subject-limit 'fuzzy)
(setq gnus-simplify-subject-functions '(gnus-simplify-subject-re
                                        gnus-simplify-subject-fuzzy
                                        gnus-simplify-whitespace))
(setq gnus-simplify-ignored-prefixes "\\(Re?\\|AW\\): *")

;; Threads werden nach den References generiert
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-references)

;; Threads werden nach dem Subject generiert
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)

;; Christoph Conrad in <m3smud2ske.fsf@ID-24456.user.dfncis.de>
(defun cc-fetch-whole-thread()
  "like `A R' `T o' `A T' in the summary buffer."
  (interactive)
  (gnus-summary-refer-references)
  (gnus-summary-top-thread)
  (gnus-summary-refer-thread))

(define-key gnus-summary-mode-map (kbd "AA") 'cc-fetch-whole-thread)
(setq gnus-article-time-format "%Y-%m-%d %T")
(setq imap-log nil)
(setq nnimap-nov-is-evil nil)
(setq gnus-treat-display-smileys nil)
(gnus-start-date-timer)


(setq mm-text-html-renderer 'w3m)
(setq mm-inline-text-html-with-images t)
(setq mm-w3m-safe-url-regexp
      (concat ".+"))

(setq gnus-confirm-mail-reply-to-news t)
