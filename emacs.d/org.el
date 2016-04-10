(autoload 'org-agenda "org-agenda" nil t)
(autoload 'org-agenda-list "org-agenda" nil t)
(autoload 'org-mode "org" nil t)
(autoload 'orgtbl-mode "org-table" nil t)

(add-auto-mode 'org-mode "\\.org$")

(setq org-hide-leading-stars t)
(setq org-log-done t)
(setq org-return-follows-link t)
(setq org-todo-keywords '((sequence "TODO" "|" "DONE" "SKIPPED" "COPIED")))
(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00"))))
(setq org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")
(setq org-agenda-start-on-weekday nil)
(setq org-read-date-prefer-future nil)


(defun ahkt-plot-table (script)
  "util function to export and plot a table using the supplied
gnuplot `script'"
  (org-table-export)
  (let ((cbuf (current-buffer))
        (cwin (selected-window)))
    (save-restriction
      (save-excursion
        (find-file script)
        (gnuplot-send-buffer-to-gnuplot)
        (bury-buffer)
        (bury-buffer (get-buffer "*gnuplot*"))))
    (and (window-live-p cwin) (select-window cwin))
    (switch-to-buffer cbuf)
    (delete-other-windows)))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "M-C-g") 'org-plot/gnuplot)
(global-set-key (kbd "C-c r") 'org-remember)

