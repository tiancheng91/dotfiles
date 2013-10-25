;;; haskell-presentation-mode.el --- Presenting Haskell things

;; Copyright (C) 2013  Chris Done

;; Author: Chris Done <chrisdone@gmail.com>

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;;; Code:

(require 'haskell-mode)

(defvar haskell-presentation-mode-keymap
  (let ((map (make-keymap)))
    (suppress-keymap map)
    (define-key map (kbd "q") 'quit-window)
    map)
  "Key map for the presentation mode.")

(define-minor-mode haskell-presentation-mode
  "Mode for presenting Haskell values."
  :lighter "-Presentation"
  :keymap haskell-presentation-mode-keymap
  (setq buffer-read-only t))

(defun haskell-present (name session code)
  "Present CODE in a popup buffer suffixed with NAME and set
SESSION as the current haskell-session."
  (let* ((name (format "*Haskell Presentation%s*" name))
         (buffer (get-buffer-create name)))
    (with-current-buffer buffer
      (unless (eq major-mode 'haskell-mode)
        (haskell-mode)
        (haskell-presentation-mode)
        (font-lock-mode -1))
      (let ((buffer-read-only nil))
        (erase-buffer)
        (insert (propertize "Hit `q' to close this window.\n\n"
                            'face
                            'font-lock-comment-face))
        (let ((point (point)))
          (insert code "\n\n")
          (font-lock-fontify-region point (point))
          (goto-char point))))
    (if (and (boundp 'haskell-presentation-mode)
             haskell-presentation-mode)
        (switch-to-buffer buffer)
      (pop-to-buffer buffer))))

(provide 'haskell-presentation-mode)

;;; haskell-presentation-mode.el ends here
