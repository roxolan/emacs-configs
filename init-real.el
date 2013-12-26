;; req-package

(eval-when-compile (package-initialize))
(require 'req-package)

;; save history

(req-package savehist
             :init (savehist-mode 1))

;; customizations

(req-package menu-bar
             :init (menu-bar-mode -1))

;; pretty lambda

(req-package pretty-lambdada
             :ensure pretty-lambdada
             :init (pretty-lambda-for-modes))

;; xt mosue

(req-package xt-mouse
             :init (xterm-mouse-mode 1))

;; helm

(req-package helm
             :ensure helm
             :init (progn (require 'helm-config)
                          (define-key global-map (kbd "C-x b") 'helm-buffers-list)))

;; use helm helm commands

(req-package helm-helm-commands
             :require helm
             :ensure helm-helm-commands)

;; helm ac

(req-package ac-helm
             :require helm
             :ensure ac-helm
             :init (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm))

;; helm themes

(req-package helm-themes
             :require helm
             :ensure helm-themes)

;; helm helm commands

(req-package helm-helm-commands
             :require helm
             :ensure helm-helm-commands)

;; main line

(req-package smart-mode-line
             :ensure smart-mode-line
             :init (progn (setq sml/theme 'dark)
                          (sml/setup)))

;; remember theme

(req-package remember-theme
             :ensure remember-theme)

;; theme park mode

(req-package theme-park-mode
             :ensure theme-park-mode)

;; toolbar

(req-package tool-bar
             :init (tool-bar-mode -1))

;; scroll bar

(req-package scroll-bar
             :init (scroll-bar-mode -1))

;; twitter

(req-package twittering-mode
             :ensure twittering-mode
             :init (progn (setq twittering-use-master-password t)
                          (setq twittering-icon-mode t)
                          (setq twittering-use-icon-storage t)))

;; indentation

(setq-default tab-width 4)
(add-hook 'find-file-hook (lambda () (setq indent-tabs-mode nil)))
(electric-indent-mode 1)

;; mark ring tweaks

(setq set-mark-command-repeat-pop t)

;; save bookmarks on emacs exit

(setq bookmark-save-flag 1)

;; helm swoop

(req-package helm-swoop
             :require helm
             :ensure helm-swoop
             :init (progn (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
                          ))

;; delete trailing whitespaces before saving some buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; mode line tweaks

(req-package simple
             :init (column-number-mode 1))

;; turn off backup files

(setq make-backup-files nil)

;; auto reverting

(req-package autorevert
             :init (progn (setq global-auto-revert-non-file-buffers t)
                          (setq auto-revert-interval 0.5)
                          (add-to-list 'auto-mode-alist
                                       '("\\.log\\'" . auto-revert-tail-mode))))

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

(add-hook 'prog-mode-hook (lambda () (which-function-mode 1)))

;; miscaleous tweeks

(setq make-pointer-invisible nil)

;; ace jump mode

(req-package ace-jump-mode
             :ensure ace-jump-mode
             :init (progn (define-key global-map (kbd "M-/") 'ace-jump-word-mode)
                          (define-key global-map (kbd "s-c") 'ace-jump-char-mode)
                          (define-key global-map (kbd "M-g M-g") 'ace-jump-line-mode)))

;; shell mode

(req-package shell)

;; ace jump buffer

(req-package ace-jump-buffer
             :require (shell ace-jump-mode)
             :ensure ace-jump-buffer
             :init (progn (define-key shell-mode-map (kbd "M-?") 'ace-jump-buffer)
                          (define-key global-map (kbd "M-?") 'ace-jump-buffer)))

;; xml

(req-package auto-complete-nxml
             :ensure auto-complete-nxml
             :init (progn (setq-default nxml-child-indent 4)
                          (setq nxml-child-indent 4)))

;; bash complete

(req-package bash-completion
             :ensure bash-completion
             :init (bash-completion-setup))

;; auto complete

(req-package auto-complete
             :ensure auto-complete
             :init (progn (global-auto-complete-mode t)
                          (setq ac-auto-start 1)
                          (setq ac-quick-help-delay 0.1)
                          (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)))

;; lua mode

(req-package lua-mode
             :ensure lua-mode
             :init (setq lua-indent-level 4))

;; js2 mode

(req-package js2-mode
             :ensure js2-mode
             :init (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; batch mode

(req-package batch-mode
             :ensure batch-mode
             :init (add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode)))

;; flymake

(req-package flymake
             :ensure flymake
             :init (progn (add-hook 'find-file-hook 'flymake-find-file-hook)
                          (global-set-key (kbd "<f2>") 'flymake-goto-prev-error)
                          (global-set-key (kbd "<f3>") 'flymake-goto-next-error)))

(req-package flymake-cursor
             :require flymake
             :ensure flymake-cursor)

;; flymake lua

(req-package flymake-lua
             :require (flymake lua-mode)
             :ensure flymake-lua
             :init (add-hook 'lua-mode-hook 'flymake-lua-load))

;; flymake shell

(req-package flymake-shell
             :require (flymake shell)
             :ensure flymake-shell
             :init (add-hook 'sh-set-shell-hook 'flymake-shell-load))

;; flymake haskell

(req-package flymake-haskell-multi
             :require (flymake haskell-mode)
             :ensure flymake-haskell-multi
             :init (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load))

;; glsl

(req-package glsl-mode
             :ensure glsl-mode
             :init (progn (add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
                          (add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
                          (add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))
                          (setq glsl-other-file-alist '(("\\.fs$" (".vs"))
                                                        ("\\.vs$" (".fs"))))))

;; yasnippet

(req-package yasnippet
             :ensure yasnippet
             :init (yas-global-mode 1))

;; haskell mode

(req-package haskell-mode
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

;; line highlight

(req-package hl-line
             :ensure hl-line
             :init (progn (global-hl-line-mode 1)))

;; todo, fixme highlighting

(req-package fic-mode
             :ensure fic-mode
             :init (add-hook 'prog-mode-hook (lambda () (fic-mode 1))))

;; move text

(req-package move-text
             :ensure move-text
             :init (progn (global-set-key (kbd "M-n") 'move-text-down)
                          (global-set-key (kbd "M-p") 'move-text-up)))

;; duplicate thing

(req-package duplicate-thing
             :ensure duplicate-thing
             :init (progn (global-set-key (kbd "M-c") 'duplicate-thing)
                          (global-set-key (kbd "M-с") 'duplicate-thing)))

;; auto pair

(req-package autopair
             :ensure autopair
             :init (add-hook 'prog-mode-hook (lambda () (autopair-mode 1))))

;; highlight parenthesis

(req-package highlight-parentheses
             :ensure highlight-parentheses
             :init (add-hook 'prog-mode-hook (lambda () (highlight-parentheses-mode 1))))

;; hl sexps

(req-package hl-sexp
             :ensure hl-sexp
             :init (add-hook 'emacs-lisp-mode-hook (lambda () (hl-sexp-mode 1))))

;; diff highlight

(req-package smartrep
             :ensure smartrep)

(req-package fringe)

(req-package diff-hl
             :require (smartrep fringe)
             :ensure diff-hl
             :init (global-diff-hl-mode 1))

;; god mode

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'hollow 'box)))

(req-package god-mode
             :ensure god-mode
             :init (progn (global-set-key (kbd "<escape>") 'god-mode)
                          (global-set-key (kbd "C-x C-1") 'delete-other-windows)
                          (global-set-key (kbd "C-x C-2") 'split-window-below)
                          (global-set-key (kbd "C-x C-3") 'split-window-right)
                          (global-set-key (kbd "C-x C-0") 'delete-window)
                          (define-key god-local-mode-map (kbd ".") 'repeat)
                          (define-key god-local-mode-map (kbd "z") 'repeat)
                          (define-key god-local-mode-map (kbd "i") 'god-mode)
                          (add-hook 'god-mode-enabled-hook 'my-update-cursor)
                          (add-hook 'god-mode-disabled-hook 'my-update-cursor)))

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

;; finish loading packages

(req-package-finish)

;; start emacs server

(server-start)
