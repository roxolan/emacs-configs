;; show vertical lines in prog mode

(req-package indent-guide
  :config (add-hook 'prog-mode-hook (lambda () (indent-guide-mode 1))))

;; some very useful extension

(req-package nyan-mode
  :config (progn (setq nyan-animation-frame-interval 0.1)
                 (setq nyan-bar-length 8)
                 (setq nyan-wavy-trail t)
                 (nyan-mode)
                 (nyan-start-animation)))

;; pretty lambda

(req-package pretty-lambdada
  :config
  (pretty-lambda-for-modes))

;; customizations

(req-package menu-bar
  :config
  (menu-bar-mode -1))

;; rotate

(req-package rotate
  :config
  (global-set-key (kbd "s-P") 'rotate-layout))

;; main line

(req-package smart-mode-line
  :config
  (progn (setq sml/shorten-modes t)
         (setq sml/shorten-directory t)
         (setq sml/name-width 20)
         (setq sml/mode-width 'full)
         (setq sml/hidden-modes nil)
         (add-to-list 'sml/hidden-modes " Anzu")
         (add-to-list 'sml/hidden-modes " AC")
         (add-to-list 'sml/hidden-modes " yas")
         (add-to-list 'sml/hidden-modes " pair")
         (add-to-list 'sml/hidden-modes " FIC")
         (add-to-list 'sml/hidden-modes " Abbrev")
         (add-to-list 'sml/hidden-modes " ARev")
         (sml/setup)
         (sml/apply-theme 'respectful)
         (setq custom-enabled-themes (reverse custom-enabled-themes))))

;; anzu

(req-package anzu
  :require
  smart-mode-line
  :config
  (global-anzu-mode 1))

;; mode line tweaks

(req-package simple
  :config
  (column-number-mode 1))

;; toolbar

(req-package tool-bar
  :config
  (tool-bar-mode -1))

;; scroll bar

(req-package scroll-bar
  :config
  (scroll-bar-mode -1))

;; turn off sctartup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; show function name

(add-hook 'prog-mode-hook (lambda () (which-function-mode 1)))

;; miscaleous tweeks

(setq make-pointer-invisible nil)

;; smooth mouse scroll

(req-package mwheel
  :config
  (progn (setq mouse-wheel-progressive-speed nil)
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

;; highlight text beyond 80 column

(req-package column-enforce-mode
  :require smart-mode-line
  :config
  (progn (add-hook 'prog-mode-hook (lambda () (column-enforce-mode)))
         (setq column-enforce-column 90)
         (add-to-list 'sml/hidden-modes
                      (concat " " (concat (int-to-string 90) "col")))))

;; line highlight

(req-package hl-line
  :config
  (progn (global-hl-line-mode 1)))

;; todo, fixme highlighting

(req-package fic-mode
  :config
  (add-hook 'prog-mode-hook (lambda () (fic-mode 1))))

;; highlight parenthesis

(req-package highlight-parentheses
  :config
  (add-hook 'prog-mode-hook (lambda () (highlight-parentheses-mode 1))))

;; diff highlight

(req-package diff-hl
  :require smartrep
  :config (global-diff-hl-mode 1))

;; desc unbound keys

(req-package unbound)

;; theme park mode

(req-package theme-park-mode :disabled t)

;; helm themes

(req-package helm-themes
  :require
  helm)

;; xt mosue

(req-package xt-mouse
  :require mouse
  :config (progn (xterm-mouse-mode 1)
                 (defun track-mouse (e))))

(req-package mouse
  :config (progn (global-set-key (kbd "<C-down-mouse-1>") nil)
                 (global-set-key (kbd "<C-down-mouse-2>") nil)
                 (global-set-key (kbd "<C-down-mouse-3>") nil)))

(provide 'init-look-and-feel)
