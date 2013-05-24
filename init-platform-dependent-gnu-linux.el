(defun init-platform-dependent-start ()
  ;; headers paths for clang completion

  (setq ac-clang-flags
	(mapcar (lambda (item) (concat "-I" item))
		(split-string
		 "
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/x86_64-unknown-linux-gnu
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/backward
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include
/usr/local/include
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include-fixed
/usr/include
"
		 )))
)

(setq battery-mode-line-format " %p%%")
(display-battery-mode)

(provide 'init-platform-dependent-gnu-linux)
