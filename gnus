;; -*- mode: emacs-lisp -*-
(setq gnus-select-method
      '(nntp "news.gmane.org"))


(setq gnus-secondary-select-methods
      '((nnimap "fork-bomb" ; primary email
                (nnimap-address "mail.fork-bomb.org")
                (nnimap-server-port 993)
                (nnimap-authenticator login)
                (nnimap-expunge-on-close 'ask)
                (nnimap-stream ssl))
        (nntp "news.gmane.org")
        ))

(setq gnus-asynchronous t)

(setq gnus-use-demon nil)


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

(setq gnus-gcc-mark-as-read t)

(setq gnus-message-archive-method '(nnimap "fork-bomb"))
(setq gnus-message-archive-group
      '((lambda (x)
          (cond
           ;; Store personal mail messages in the same group I started out in
           ((string-match "INBOX.*" group) group)
           ;; I receive a copy of all messages I send to a list, so there's no need to archive
           ((string-match "MLs\..*" group) nil)
           ;; Store everything else in misc until I can sort it out
           (t nil)))))

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
   gnus-sum-thread-tree-indent          "  ")
  )

(defun oxy-unicode-threads-heavy ()
  (interactive)
  (setq gnus-summary-line-format "%10{%4k│%}%0{%U%R%z%u&@;%}%10{│%}%*%-23,23f%10{║%} %10{%B%} %(%s%)\n"
        gnus-summary-dummy-line-format "    %8{│%}    %(%8{│%}                       %10{║%}%) %10{┏○%}  %S\n"
        gnus-sum-thread-tree-indent " "
        gnus-sum-thread-tree-root "┏● "
        gnus-sum-thread-tree-false-root "　○ "
        gnus-sum-thread-tree-single-indent "　● "
        gnus-sum-thread-tree-leaf-with-other "┣━━❯ "
        gnus-sum-thread-tree-vertical "┃"
        gnus-sum-thread-tree-single-leaf "┗━━❯ "))

(copy-face 'font-lock-constant-face 'gnus-face-8)
(set-face-foreground 'gnus-face-8 "gray50")
(setq gnus-face-8 'gnus-face-8)
(setq gnus-face-9 'font-lock-warning-face)
(setq gnus-face-10 'shadow)

;; (sdl-gnus-summary-line-format-unicode)
(oxy-unicode-threads-heavy)

(setq gnus-user-date-format-alist
      '((t . "%Y-%m-%d %T")))

(setq gnus-fetch-old-headers nil)
(setq gnus-article-sort-functions '(gnus-article-sort-by-number gnus-article-sort-by-score))
(setq gnus-thread-sort-functions '(gnus-thread-sort-by-number gnus-thread-sort-by-score))
(setq gnus-build-sparse-threads nil)
(setq gnus-summary-display-while-building nil)
(setq gnus-summary-make-false-root 'dummy)

(setq gnus-summary-gather-subject-limit 'fuzzy)
(setq gnus-simplify-subject-functions '(gnus-simplify-subject-re
                                        gnus-simplify-subject-fuzzy
                                        gnus-simplify-whitespace))
(setq gnus-simplify-ignored-prefixes "\\(Re?\\|AW\\): *")
(setq gnus-list-identifiers "\\[go-nuts\\] *\\|\\[golang-dev\\] *")
;; (setq gnus-summary-thread-gathering-function
;;       'gnus-gather-threads-by-references)

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
(setq nnimap-nov-is-evil t)
(setq gnus-treat-display-smileys nil)
(gnus-start-date-timer)


(setq mm-text-html-renderer 'w3m)
(setq mm-inline-text-html-with-images t)
(setq mm-w3m-safe-url-regexp
      (concat ".+"))

(setq gnus-confirm-mail-reply-to-news t)

(setq bbdb/mail-auto-create-p 'bbdb-ignore-some-messages-hook)
(setq bbdb/news-auto-create-p 'bbdb-ignore-some-messages-hook)
(setq bbdb-ignore-some-messages-alist
      '(("From" . ".+\.invalid")
        ("From" . "@reply\.github\.com>")
        ("From" . "@public\.gmane\.org")))

(setq gnus-score-expiry-days nil)
(add-hook 'message-sent-hook 'gnus-score-followup-thread)

(setq gnus-thread-ignore-subject t)


(setq gnus-auto-subscribed-groups "^nnml\\|^nnfolder\\|^nnmbox\\|^nnmh\\|^nnbabyl\\|^nnmaildir\\|^nnimap")
(setq gnus-cacheable-groups "^nntp")
(setq gnus-novice-user nil)
;; (setq gnus-select-method (quote (nntp "news.gmane.org")))
(setq gnus-sorted-header-list (quote ("^From:" "^To:" "^Cc:" "^Subject:" "^Summary:" "^Keywords:" "^Newsgroups:" "^Followup-To:" "^Date:" "^X-Sent:" "^Organization:")))

(setq message-generate-headers-first t)

(setq gnus-use-cache t)
(setq gnus-cache-enter-articles '(ticked dormant))
(setq gnus-cache-remove-articles nil)

(setq gnus-default-adaptive-score-alist '())



(setq gnus-article-display-hook
      '(gnus-article-add-buttons
        gnus-article-emphasize
        gnus-article-fill-cited-article
        gnus-article-highlight-citation
        gnus-article-hide-headers-if-wanted
        gnus-article-hide-boring-headers
        gnus-article-treat-overstrike
        gnus-article-maybe-highlight))

(setq gnus-score-thread-simplify t)
(setq gnus-signature-limit 5)


(setq gnus-add-to-list t)
(setq message-subscribed-address-functions
      '(gnus-find-subscribed-addresses))

(setq gnus-confirm-mail-reply-to-news t)
(setq gnus-confirm-treat-mail-like-news t)
