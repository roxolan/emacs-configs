(defun init-platform-dependent-start ()
  ;; headers paths for clang completion

  (setq ac-clang-flags 
	(mapcar (lambda (item) (concat "-I" item))
		(split-string
		 "
/usr/include/c++/4.2.1
/usr/include/c++/4.2.1/backward
/usr/local/include
/usr/bin/../lib/clang/4.1/include
/usr/include
"
		 )))

  ;; lua

  (setq flymake-luac-program "/usr/local/bin/luac")
)

(provide 'init-platform-dependent)
