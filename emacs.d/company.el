(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-minimum-prefix-length 0)               ; autocomplete right after '.'
(setq company-idle-delay t)                         ; shorter delay before autocompletion popup
(setq company-echo-delay 0)                          ; removes annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(global-set-key (kbd "M-/") 'company-complete)

(global-company-mode t)
