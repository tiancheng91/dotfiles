;;; $Id: procmail-mode.el,v 1.8 2005/03/27 22:40:11 makoto Exp $
;;; http://tiny-tools.sourceforge.net/emacs-font-body.html
;;;
;;;  5.6 Procmail
;;; Andrew Cosgriff ajc@unico.com.au
;;;
;;; here's all you need to do to highlight your .procmailrc - (i put a -*-
;;; procmail -*- at the top of my .procmailrc to activate this "mode". If
;;; anybody has a real indenting mode for procmailrc's, i'd love to see it.).
;;; Works for me under XEmacs 19.14.

(defun procmail-mode ()
  "Mode for highlighting procmailrc files"
  (interactive)
  (setq mode-name "Procmail"
        major-mode 'procmail)

  (require 'font-lock)
  (make-local-variable 'font-lock-defaults)


  (make-face                   'comment-face)
  (set-face-foreground         'comment-face "yellow")
  (set-face-background         'comment-face "blue")
  (set-face-bold-p             'comment-face t)
  (set-face-italic-p           'comment-face t)
  (set-face-underline-p        'comment-face t)
  (setq font-lock-doc-string-face 'comment-face)

  (make-face                   'separater-face)
  (set-face-foreground         'separater-face "red")
  (set-face-background         'separater-face "oldlace")
  (set-face-bold-p             'separater-face t)
  (set-face-italic-p           'separater-face t)
  (set-face-underline-p        'separater-face t)
  (setq font-lock-separater-face 'separater-face)


  (setq procmail-font-lock-keywords
        (list
              '(":0"
                . font-lock-separater-face)      ;
              '("#.*"                            ; �ǽ�˰��פ������
                . font-lock-string-face)         ;  pale brown
;             '("|"
;               . font-lock-separater-face)
              '("\\^\\*.*"
                . font-lock-comment-face)
; --------
              '("^[\t ]*:.*"
                . font-lock-function-name-face) ; blue ?
; --------  generic mail address
              '("<.*>\\|[a-z0-9_.=\-]+@[a-z0-9_.=\-]+\\|@[a-z0-9_.=\-]+.*"
                . font-lock-variable-name-face )         ; light brown
; ---------    M A I L   H E A D E R
              '("Return-Path:\\|Subject:\\|From:\\|To:\\|Cc:\\|Received:"
                . font-lock-type-face)         ; green
; ---------
              '("Content-Type:.*$"
                . font-lock-type-face)         ; green
; ---------    G E N E R I C    M A I L   H E A D E R
              '(".*:"
                . font-lock-type-face)         ; green
              '("^[A-Z]+= \\.\\*$"
                . font-lock-constant-face)         ; turquoize
;             '("^[\t ]*.*^.*"
;             '("^[\t ]*\\*\\^.*"                 ;  * ^(To|From|Cc):.*nmtora@dd.iij4u.or.jp
;             '("^[\t ]\\*.*^"                    ; tab * ^ OK but no ^*
              '("^[\t ]*\\*.*^"                   ; almost OK, but no ^* ^(To|From|Cc): \\ for literal
                . font-lock-doc-string-face)      ; *
              '("^[\t ]*\\*.*^\\("                ;
                . font-lock-doc-string-face)      ; *
              '("^[\t ]*0:"
                . font-lock-function-name-face)         ; blue
              '("^\\.\\*/\\.$"
                . font-lock-keyword-face)         ; violet
              '("\\.\\*"
                . font-lock-builtin-face)         ; violet
              '("^.*/.*"                            ; files (to store) may start with /
                . font-lock-builtin-face)         ; violet
              '("*\ +^"
                . font-lock-warning-face)         ; red

; ---------- j u s t  f o r   s a m p l e -----
;       ( You should have those comment lines on your .procmailrc and
;         figure out their colors. )
              '("^#  font-lock-builtin-face"
                .  font-lock-builtin-face )
              '("^#  font-lock-comment-face"
                .  font-lock-comment-face )
              '("^#  font-lock-constant-face"
                .  font-lock-constant-face )
              '("^#  font-lock-doc-face"
                .  font-lock-doc-face )
;             '("^#  font-lock-doc-string-face"  .
;                     font-lock-doc-string-face )
              '("^#  font-lock-function-name-face" .
                    font-lock-function-name-face )
              '("^#  font-lock-keyword-face"
                .  font-lock-keyword-face )
              '("^#  font-lock-reference-face"
                .  font-lock-reference-face )
              '("^#  font-lock-string-face"
                .  font-lock-string-face )
              '("^#  font-lock-type-face"
                .  font-lock-type-face )
              '("^#  font-lock-variable-name-face"
                .  font-lock-variable-name-face )
              '("^#  font-lock-warning-face"
                .  font-lock-warning-face )
              '("^#  font-lock-syntactic-face-function"
                .  font-lock-syntactic-face-function )
;;            '("^#  font-lock-highlighting-faces"
;;              .  font-lock-highlighting-faces )

              '("#.*"
                . font-lock-string-face)         ;  pale brown
              ))
  (setq font-lock-defaults '(procmail-font-lock-keywords t))
  (font-lock-mode t) )


;
; If moving the mouse over text changes the text's color,
; you can click <mouse-2> on that text to get more information.
; In this buffer, go to the name of the command, or function, or variable,
; and type RET to get full documentation.
;
;#  color sample ( have this lines in your ~/.procmailrc to see the colors

; ; -----------------------
; ;  14 types
; ; -----------------------
; ; - #  font-lock-builtin-face          pink          1
; ; - #  font-lock-comment-face          brown         2
; ; - #  font-lock-constant-face         turquoize     3
; ; - #  font-lock-doc-face              pale  brown   4
; ; - #  font-lock-doc-string-face
; ; - #  font-lock-function-name-face    blue          5
; ; - #  font-lock-keyword-face          violet        6
; ; - #  font-lock-reference-face
; ; - #  font-lock-string-face
; ; - #  font-lock-type-face             green         7
; ; - #  font-lock-variable-name-face    light brown   8
; ; - #  font-lock-warning-face          red           9