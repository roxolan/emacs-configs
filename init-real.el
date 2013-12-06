;; use-package

(eval-when-compile (package-initialize))
(require 'use-package)

;; customizations

(use-package menu-bar
  :init (menu-bar-mode -1))

;; pretty lambda

(use-package pretty-lambdada
  :ensure pretty-lambdada
  :init (pretty-lambda-for-modes))

;; helm

(use-package helm
  :ensure helm
  :init (define-key global-map (kbd "C-x b") 'helm-buffers-list))

;; use helm helm commands

(use-package helm-helm-commands
  :ensure helm-helm-commands)

;; helm ac

(use-package ac-helm
  :ensure ac-helm
  :init (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm))

;; helm themes

(use-package helm-themes
  :ensure helm-themes)

;; helm ls git

(use-package helm-ls-git
  :ensure helm-ls-git)

;; use helm open github

(use-package helm-open-github
  :ensure helm-open-github)

;; magit

(use-package magit
  :ensure magit)

;; helm helm commands

(use-package helm-helm-commands
  :ensure helm-helm-commands)

;; main line

(use-package smart-mode-line
  :ensure smart-mode-line
  :init (progn (setq sml/theme 'dark)
			   (sml/setup)))

;; toolbar

(use-package tool-bar
  :init (tool-bar-mode -1))

;; scroll bar

(use-package scroll-bar
  :init (scroll-bar-mode -1))

;; indentation

(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(electric-indent-mode 1)

;; mark ring tweaks

(setq mark-ring-max 4)
(setq global-mark-ring-max 8)
(setq set-mark-command-repeat-pop t)

;; save bookmarks on emacs exit

(setq bookmark-save-flag 1)

;; single dired

(use-package dired
  :init (use-package dired-single
		  :ensure dired-single
		  :init (progn (define-key dired-mode-map (kbd "f") 'dired-single-buffer)
					   (define-key dired-mode-map (kbd "<RET>") 'dired-single-buffer)
					   (define-key dired-mode-map (kbd "^") (function (lambda () (interactive) (dired-single-buffer "..")))))))

;; delete trailing whitespaces before saving some buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; mode line tweaks

(use-package simple
  :init (column-number-mode 1))

;; turn off backup files

(setq make-backup-files nil)

;; auto reverting dired buffer

(add-hook 'dired-mode-hook (lambda () (auto-revert-mode 1)))
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-interval 1)

;; auto reverting log files

(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

;; enable upcase and downcase region commands

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; enable narrowing

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; focus follows mouse

(setq mouse-autoselect-window t)

;; deafult mode for text editing

(setq-default major-mode 'text-mode)

;; turn off sctartup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; disable defining variables in files

(setq enable-local-variables nil)

;; show function name

(add-hook 'prog-mode-hook (lambda () (which-func-mode 1)))

;; miscaleous tweeks

(setq make-pointer-invisible nil)

;; ace jump mode

(use-package ace-jump-mode
  :ensure ace-jump-mode
  :init (progn (define-key global-map (kbd "M-/") 'ace-jump-word-mode)
			   (define-key global-map (kbd "s-c") 'ace-jump-char-mode)
			   (define-key global-map (kbd "M-g M-g") 'ace-jump-line-mode)
			   (define-key global-map (kbd "M-g g") 'ace-jump-line-mode)))

;; ace jump buffer

(use-package ace-jump-buffer
  :ensure ace-jump-buffer
  :init (progn (define-key shell-mode-map (kbd "M-?") 'ace-jump-buffer)
			   (define-key global-map (kbd "M-?") 'ace-jump-buffer)))

;; xml

(use-package auto-complete-nxml
  :ensure auto-complete-nxml
  :init (progn (setq-default nxml-child-indent 4)
			   (setq nxml-child-indent 4)))

;; bash complete

(use-package bash-completion
  :ensure bash-completion
  :init (bash-completion-setup))

;; auto complete

(use-package auto-complete-config
  :ensure auto-complete
  :init (progn (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")
			   (global-auto-complete-mode t)
			   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
			   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
			   (add-hook 'css-mode-hook 'ac-css-mode-setup)
			   (add-hook 'auto-complete-mode-hook 'ac-common-setup)))

;; auto complete clang

(defun find-makefile-dir (cur)
  (if (file-exists-p (concat cur "Makefile"))
	  cur
	(if (string-equal (expand-file-name cur) "/")
		nil
	  (find-makefile-dir (expand-file-name (concat cur "../"))))))

(defun expand-include-flag (a)
  (if (string-prefix-p "-I" a)
	  (concat "-I" (expand-file-name (concat (find-makefile-dir "./") (substring a 2))))
	a))

(defun cc-mode-clang-hook ()
  (setq ac-sources '(ac-source-clang ac-source-yasnippet))
  (setq ac-clang-flags
		(mapcar (lambda (item) (concat "-I" item))
				(split-string (shell-command-to-string "bash ~/.emacs.d/clang-include-paths.sh"))))
  (setq ac-clang-flags (append ac-clang-flags
							   (mapcar 'expand-include-flag
									   (split-string (shell-command-to-string (concat (concat "make -C " (find-makefile-dir "./")) " -s print-cflags")))))))

(use-package auto-complete-clang
  :ensure auto-complete-clang
  :init (progn (setq ac-auto-start 1)
			   (setq ac-quick-help-delay 0.5)
			   ;; (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
			   (add-hook 'c-mode-common-hook 'cc-mode-clang-hook)))

;; detect mode for .h file

(use-package dummy-h-mode
  :ensure dummy-h-mode
  :init (progn (add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
			   (add-hook 'dummy-h-mode-hook
						 (lambda ()
						   (setq dummy-h-mode-default-major-mode 'c++-mode)))
			   (add-hook 'dummy-h-mode-hook
						 (lambda ()
						   (setq dummy-h-mode-search-limit 60000)))))

;; headers completion

(use-package ac-c-headers
  :ensure ac-c-headers
  :init (add-hook 'c-mode-common-hook (lambda ()
										(setq cc-search-directories (split-string (shell-command-to-string "bash ~/.emacs.d/clang-include-paths.sh")))
										(add-to-list 'ac-sources 'ac-source-c-headers)
										(add-to-list 'ac-sources 'ac-source-c-header-symbols t))))

;; gdb

(setq gdb-many-windows t)
(setq gdb-show-main t)

;; scala mode

(use-package scala-mode2-autoloads
  :ensure scala-mode2)

(use-package sbt-mode-autoloads
  :ensure sbt-mode)

;; lua mode

(use-package lua-mode-autoloads
  :ensure lua-mode
  :init (setq lua-indent-level 4))

;; js2 mode

(use-package js2-mode-autoloads
  :ensure js2-mode
  :init (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; batch mode

(use-package batch-mode
  :ensure batch-mode
  :init (add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode)))

;; flymake

(use-package flymake
  :ensure flymake
  :init (progn (add-hook 'find-file-hook 'flymake-find-file-hook)
			   (global-set-key (kbd "<f2>") 'flymake-goto-prev-error)
			   (global-set-key (kbd "<f3>") 'flymake-goto-next-error)))

(use-package flymake-cursor-autoloads
  :ensure flymake-cursor)

;; flymake lua

(use-package flymake-lua-autoloads
  :ensure flymake-lua
  :init (add-hook 'lua-mode-hook 'flymake-lua-load))

;; flymake shell

(use-package flymake-shell-autoloads
  :ensure flymake-shell
  :init (add-hook 'sh-set-shell-hook 'flymake-shell-load))

;; flymake haskell

(use-package flymake-haskell-multi-autoloads
  :ensure flymake-haskell-multi
  :init (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load))

;; glsl

(use-package glsl-mode
  :ensure glsl-mode
  :init (progn (add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
			   (add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
			   (add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))
			   (setq glsl-other-file-alist '(("\\.fs$" (".vs"))
											 ("\\.vs$" (".fs"))))))

;; yasnippet

(use-package yasnippet-autoloads
  :ensure yasnippet
  :init (yas-global-mode 1))

;; haskell mode

(use-package haskell-mode-autoloads
  :ensure haskell-mode
  :init (progn (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
			   (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)))

;; smooth mouse scroll

(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse t) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq auto-window-vscroll nil)
(setq scroll-preserve-screen-position t)
(setq isearch-allow-scroll t)

;; line numbers

(use-package linum
  :ensure linum
  :init (progn (global-linum-mode 1)
			   (setq linum-format "%4d|")))

;; line highlight

(use-package hl-line
  :ensure hl-line
  :init (progn (global-hl-line-mode 1)))

;; todo, fixme highlighting

(use-package fic-mode-autoloads
  :ensure fic-mode
  :init (add-hook 'prog-mode-hook (lambda () (fic-mode 1))))

;; move text

(use-package move-text-autoloads
  :ensure move-text
  :init (progn (global-set-key (kbd "M-n") 'move-text-down)
			   (global-set-key (kbd "M-p") 'move-text-up)))

;; duplicate thing

(use-package duplicate-thing-autoloads
  :ensure duplicate-thing
  :init (progn (global-set-key (kbd "M-c") 'duplicate-thing)
			   (global-set-key (kbd "M-с") 'duplicate-thing)))

;; auto pair

(use-package autopair-autoloads
  :ensure autopair
  :init (add-hook 'prog-mode-hook (lambda () (autopair-mode 1))))

;; highlight parenthesis

(use-package highlight-parentheses-autoloads
  :ensure highlight-parentheses
  :init (add-hook 'prog-mode-hook (lambda () (highlight-parentheses-mode 1))))

;; diff highlight

(use-package smartrep
  :ensure smartrep)

(use-package diff-hl
  :ensure diff-hl
  :requires fringe
  :init (progn (global-diff-hl-mode 1)
			   (add-hook 'dired-mode-hook (lambda () (diff-hl-dired-mode 1)))))

;; shrink/enlarge window

(global-set-key (kbd "s-{") (lambda () (interactive) (shrink-window 10 1)))
(global-set-key (kbd "s-}") (lambda () (interactive) (enlarge-window 10 1)))
(global-set-key (kbd "s-?") (lambda () (interactive) (shrink-window 5 nil)))
(global-set-key (kbd "s-\"") (lambda () (interactive) (enlarge-window 5 nil)))
(global-set-key (kbd "s-]") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "s-[") (lambda () (interactive) (other-window -1)))

;; ru keys

(global-set-key (kbd "C-ч C-а") 'find-file)
(global-set-key (kbd "C-ч C-с") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-ч C-ы") 'save-buffer)
(global-set-key (kbd "C-ч и") 'switch-to-buffer)
(global-set-key (kbd "C-р л") 'describe-key)
(global-set-key (kbd "M-в") 'kill-word)
(global-set-key (kbd "M-а") 'forward-word)
(global-set-key (kbd "M-и") 'backward-word)
(global-set-key (kbd "C-в") 'delete-char)
(global-set-key (kbd "C-.") 'undo)
(global-set-key (kbd "C-ф") 'move-beginning-of-line)
(global-set-key (kbd "C-у") 'move-end-of-line)
(global-set-key (kbd "C-з") 'previous-line)
(global-set-key (kbd "C-т") 'next-line)
(global-set-key (kbd "C-ц") 'kill-region)
(global-set-key (kbd "C-н") 'yank)
(global-set-key (kbd "C-л") 'kill-line)
(global-set-key (kbd "C-ы") 'isearch-forward)
(global-set-key (kbd "C-п") 'keyboard-quit)
(global-set-key (kbd "C-ч щ") 'other-window)
(global-set-key (kbd "C-ч л") 'kill-buffer)
(global-set-key (kbd "M-ч") 'execute-extended-command)
(global-set-key (kbd "C-и") 'backward-char)
(global-set-key (kbd "C-а") 'forward-char)
(global-set-key (kbd "C-ч 1") 'delete-other-windows)
(global-set-key (kbd "C-ч 2") 'split-window-below)
(global-set-key (kbd "C-ч 3") 'split-window-right)
(global-set-key (kbd "M-ц") 'kill-ring-save)
(global-set-key (kbd "C-о") 'newline-and-indent)
(global-set-key (kbd "C-ь") 'autopair-newline)
(global-set-key (kbd "M-р") 'backward-kill-word)
(global-set-key (kbd "C-р") 'autopair-backspace)
(global-set-key (kbd "C-ч р") 'mark-whole-buffer)

;; init.d

(use-package load-dir
  :ensure load-dir
  :init (load-dir-one "~/.emacs.d/init.d"))

;; platform depended

(cond ((eq system-type 'darwin) (load-file "~/.emacs.d/init-platform-dependent-darwin.el"))
	  ((eq system-type 'windows-nt) (load-file "~/.emacs.d/init-platform-dependent-windows-nt.el"))
	  ((eq system-type 'gnu/linux) (load-file "~/.emacs.d/init-platform-dependent-gnu-linux.el")))

(init-platform-dependent-start)

;; start emacs server

(server-start)
