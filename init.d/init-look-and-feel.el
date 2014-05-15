;; show vertical lines in prog mode

(req-package indent-guide
  :init (add-hook 'prog-mode-hook (lambda () (indent-guide-mode 1))))

;; some very useful extension

(req-package nyan-mode
  :init (progn (setq nyan-animation-frame-interval 0.1)
               (setq nyan-bar-length 8)
               (setq nyan-wavy-trail t)
               (nyan-mode)
               (nyan-start-animation)))

;; fonts

(set-default-font "SourceCodePro-9" t)
(set-fontset-font "fontset-default" 'cyrillic-iso8859-5 '("Liberation Mono" . "iso10646-1"))

;; pretty lambda

(req-package pretty-lambdada
  :init
  (pretty-lambda-for-modes))

;; customizations

(req-package menu-bar
  :init
  (menu-bar-mode -1))

;; rotate

(req-package rotate
  :init
  (global-set-key (kbd "s-P") 'rotate-layout))

;; main line

(req-package smart-mode-line
  :require
  remember-theme
  :init
  (progn (setq sml/theme 'respectfull)
         (setq sml/shorten-modes t)
         (setq sml/shorten-directory t)
         (setq sml/name-width 20)
         (setq sml/mode-width 'full)
         (add-to-list 'sml/hidden-modes " Anzu")
         (add-to-list 'sml/hidden-modes " AC")
         (add-to-list 'sml/hidden-modes " yas")
         (add-to-list 'sml/hidden-modes " pair")
         (add-to-list 'sml/hidden-modes " 80col")
         (add-to-list 'sml/hidden-modes " FIC")
         (add-to-list 'sml/hidden-modes " Abbrev")
         (add-to-list 'sml/hidden-modes " ARev")
         (sml/setup)))

;; anzu

(req-package anzu
  :require
  smart-mode-line
  :init
  (global-anzu-mode 1))

;; mode line tweaks

(req-package simple
  :init
  (column-number-mode 1))

;; toolbar

(req-package tool-bar
  :init
  (tool-bar-mode -1))

;; scroll bar

(req-package scroll-bar
  :init
  (scroll-bar-mode -1))

;; expand region

(req-package expand-region
  :require
  sml-mode
  :init
  (global-set-key (kbd "C-=") 'er/expand-region))

;; turn off sctartup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; show function name

(add-hook 'prog-mode-hook (lambda () (which-function-mode 1)))

;; miscaleous tweeks

(setq make-pointer-invisible nil)

;; smooth mouse scroll

(req-package mwheel
  :init
  (progn ;; (setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
         (setq mouse-wheel-progressive-speed nil)
         (setq mouse-wheel-follow-mouse t)
         (global-set-key (kbd "<mouse-6>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-mouse-6>") (lambda () (interactive) nil))
         (global-set-key (kbd "<triple-mouse-6>") (lambda () (interactive) nil))
         (global-set-key (kbd "<mouse-7>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-mouse-7>") (lambda () (interactive) nil))
         (global-set-key (kbd "<triple-mouse-7>") (lambda () (interactive) nil))
         (setq scroll-step 2)
         (setq auto-window-vscroll nil)
         (setq scroll-preserve-screen-position t)
         (setq isearch-allow-scroll t)))

(req-package smooth-scroll
  :require mwheel
  :init (progn (smooth-scroll-mode)
               (setq smooth-scroll/vscroll-step-size 6)))

(req-package smooth-scrolling
  :require smooth-scroll)

;; highlight text beyond 80 column

(req-package column-enforce-mode
  :init
  (add-hook 'prog-mode-hook (lambda () (column-enforce-mode))))

;; line highlight

(req-package hl-line
  :init
  (progn (global-hl-line-mode 1)))

;; todo, fixme highlighting

(req-package fic-mode
  :init
  (add-hook 'prog-mode-hook (lambda () (fic-mode 1))))

;; highlight parenthesis

(req-package highlight-parentheses
  :init
  (add-hook 'prog-mode-hook (lambda () (highlight-parentheses-mode 1))))

;; hl sexps

(req-package hl-sexp
  :require
  hl-line
  :init
  (add-hook 'emacs-lisp-mode-hook (lambda () (hl-sexp-mode 1))))

;; diff highlight

(req-package diff-hl
  :require
  (smartrep fringe)
  :init
  (global-diff-hl-mode 1))

;; highlight defined symbols

(req-package hl-defined
  :init
  (add-hook 'emacs-lisp-mode-hook 'hdefd-highlight-mode))

;; desc unbound keys

(req-package unbound)

;; remember theme

(req-package remember-theme)

;; theme park mode

(req-package theme-park-mode)

;; helm themes

(req-package helm-themes
  :require
  helm)

;; xt mosue

(req-package xt-mouse
  :require mouse
  :init (progn (xterm-mouse-mode 1)
               (defun track-mouse (e))))

(provide 'init-look-and-feel)
