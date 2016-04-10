(require 'key-chord)
(require 'ace-jump-mode)
(setq ace-jump-mode-move-keys
      (loop for i from ?a to ?z collect i))

(key-chord-define-global "jj" 'ace-jump-char-mode)
(key-chord-define-global "JJ" 'ace-jump-mode-pop-mark)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "M-z") 'ace-jump-zap-to-char)
