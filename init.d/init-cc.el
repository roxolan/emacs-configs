(require 'req-package)

;; clang format

(req-package clang-format
  :commands clang-format-region)

;; completion with clang

(defconst cc-style
  '("bsd"
    (c-offsets-alist . ((innamespace . [0])))))

(req-package cc-mode
  :require key-chord
  :mode (("\\.cpp\\'" . c++-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.h\\'" . c++-mode))
  :config (progn (key-chord-define c++-mode-map ";;"  "\C-e;")
				 (key-chord-define c++-mode-map "//"  "\C-e //")
				 (key-chord-define c++-mode-map "{}"  "{\n\n}\C-p\t")
				 (key-chord-define c++-mode-map "(}"  "() {\n\n}\C-p\t")
                 (c-add-style "cc-style" cc-style)
                 (setq-default c-basic-offset 4)
                 (setq-default c-default-style "cc-style")))

;; detect mode for .h file

(req-package dummy-h-mode
  :commands dummy-h-mode
  :init (add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
  :config (progn
            (req-package-hooks-add-execute 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-default-major-mode 'c++-mode)))
            (req-package-hooks-add-execute 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-search-limit 60000)))))

;; gdb

(req-package gdb-mi
  :require
  cc-mode
  :config
  (progn (setq gdb-many-windows t)
         (setq gdb-show-main t)))

;; rtags

(req-package rtags :require cc-mode)

(provide 'init-cc)
