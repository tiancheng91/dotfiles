;;; go-impl-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "go-impl" "go-impl.el" (22255 9923 948483 768000))
;;; Generated autoloads from go-impl.el

(autoload 'go-impl "go-impl" "\
Run the impl tool with RECV and IFACE and insert the result at point.

If `go-impl-aliases-alist' has an entry with IFACE as the key,
that entry's value will be used in place of IFACE. This allows
creating aliases such as \"sort\" for \"sort.Interface\" or
\"string\" for \"fmt.Stringer\".

If `go-impl-enter-function' is non-nil, point will move inside
the first inserted function.

See https://github.com/josharian/impl to obtain the tool.

\(fn RECV IFACE)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; go-impl-autoloads.el ends here
