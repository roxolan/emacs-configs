(defun init-platform-dependent-start ()
  ;; headers paths for clang completion

  (setq ac-clang-flags 
	(mapcar (lambda (item) (concat "-I" item))
		(split-string
		 "
<<<<<<< HEAD
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/x86_64-unknown-linux-gnu
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/backward
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include
/usr/local/include
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include-fixed
/usr/include
"
		 )))
=======
/usr/include/c++/4.2.1
/usr/include/c++/4.2.1/backward
/usr/local/include
/usr/bin/../lib/clang/4.1/include
/usr/include
"
		 )))

  ;; lua

  (setq flymake-luac-program "/usr/local/bin/luac")
>>>>>>> cc806ee256e924a9c03771c3cf8a1971086fa257
)

(setq battery-mode-line-format " %p%%")
(display-battery-mode)

(provide 'init-platform-dependent)
