(yas/initialize)
(setq yas/root-directory "~/.emacs.d/contrib/yasnippet/snippets/")
(yas/load-directory yas/root-directory)
(setq yas/prompt-functions '(yas/dropdown-prompt))
