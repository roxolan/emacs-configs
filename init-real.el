;; req-package

(eval-when-compile (package-initialize))

(require 'cl)

(defun package-try-install (package)
  "installs package if not installed"
  (let* ((ARCHIVES (if (null package-archive-contents)
                       (progn (package-refresh-contents)
                              package-archive-contents)
                     package-archive-contents))
         (AVAIL (some (lambda (elem)
                        (eq (car elem) package))
                      ARCHIVES)))
    (if AVAIL
        (package-install package))))

(if (null (require 'req-package "req-package" t))
    (progn (package-try-install 'req-package)
           (require 'req-package)))

;; use emr

(req-package emr
             :init
             (progn (emr-initialize)
                    (define-key emacs-lisp-mode-map
                      (kbd "M-RET")
                      'emr-show-refactor-menu)))

;; pkgbuild mode

(req-package pkgbuild-mode
             :mode
             "\\PKGBUILD\\'")

;; xml

(req-package auto-complete-nxml
             :require auto-complete
             :init (progn (setq-default nxml-child-indent 4)
                          (setq nxml-child-indent 4)))

;; bash complete

(req-package bash-completion
             :require auto-complete
             :init (bash-completion-setup))

;; auto complete

(req-package auto-complete
             :init (progn (require 'auto-complete-config)
                          (global-auto-complete-mode t)
                          (setq ac-auto-start 1)
                          (setq ac-quick-help-delay 0.1)
                          (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)))

;; lua mode

(req-package lua-mode
             :init (setq lua-indent-level 4))

;; js2 mode

(req-package js2-mode
             :init (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; batch mode

(req-package batch-mode
             :init (add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode)))

;; flymake

(req-package flymake
             :init (progn (add-hook 'find-file-hook 'flymake-find-file-hook)
                          (global-set-key (kbd "<f2>") 'flymake-goto-prev-error)
                          (global-set-key (kbd "<f3>") 'flymake-goto-next-error)
                          (setq flymake-gui-warnings-enabled nil)
                          (setq flymake-log-level 0)))

(req-package flymake-cursor
             :require flymake)

;; flymake lua

(req-package flymake-lua
             :require (flymake lua-mode)
             :init (add-hook 'lua-mode-hook 'flymake-lua-load))

;; flymake shell

(req-package flymake-shell
             :require (flymake shell)
             :init (add-hook 'sh-set-shell-hook 'flymake-shell-load))

;; flymake haskell

(req-package flymake-haskell-multi
             :require (flymake haskell-mode)
             :init (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load))

;; glsl

(req-package glsl-mode
             :init (progn (add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
                          (add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
                          (add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))
                          (setq glsl-other-file-alist '(("\\.fs$" (".vs"))
                                                        ("\\.vs$" (".fs"))))))

;; yasnippet

(req-package yasnippet
             :init (yas-global-mode 1))

;; haskell mode

(req-package haskell-mode
             :init (progn (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
                          (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)))

;; init.d

(use-package load-dir
  :ensure load-dir
  :init (load-dir-one "~/.emacs.d/init.d"))

;; finish loading packages

(req-package-finish)

;; start emacs server

(server-start)
