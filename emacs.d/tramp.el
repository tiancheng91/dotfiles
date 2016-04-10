(tramp-set-completion-function "scpc"
                               (tramp-get-completion-function "ssh"))

(add-to-list 'tramp-default-proxies-alist
             '("\\vserver\\'" "\\`root\\'" "/ssh:%h:"))
