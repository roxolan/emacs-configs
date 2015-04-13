;; cursor configuration

(setq-default cursor-type 'bar)

;; use timeclock

(req-package timeclock
  :config (progn (timeclock-mode-line-display 1)
                 (add-hook 'kill-emacs-query-functions 'timeclock-query-out)))

;; highlight number in code

(req-package highlight-numbers
  :config (add-hook 'find-file-hook (lambda () (highlight-numbers-mode 1))))

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

;; pretty symbols mode

(if (has-emacs-version 24 4)
    (global-prettify-symbols-mode 1))

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
		 (setq sml/theme nil)
         (add-to-list 'sml/hidden-modes " Anzu")
         (add-to-list 'sml/hidden-modes " AC")
         (add-to-list 'sml/hidden-modes " yas")
         (add-to-list 'sml/hidden-modes " pair")
         (add-to-list 'sml/hidden-modes " FIC")
         (add-to-list 'sml/hidden-modes " Abbrev")
         (add-to-list 'sml/hidden-modes " ARev")
         (sml/setup)))

;; theme

(defun gen-my-theme-form (file theme &optional package)
  (append (list 'req-package file)
          (list :require 'smart-mode-line)
          (if package (list :ensure package) nil)
          (list :config (list 'progn
                              '(sml/apply-theme (quote respectful) nil t)
                              (list 'load-theme (list 'quote 'smart-mode-line-respectful) t)
                              '(sml/apply-theme (quote respectful) nil t)))))

(defconst my-favourite-themes (vector (gen-my-theme-form 'tao-yin-theme 'tao-yin 'tao-theme)
                                      (gen-my-theme-form 'soothe-theme 'soothe)
                                      (gen-my-theme-form 'gotham-theme 'gotham)
                                      (gen-my-theme-form 'gruvbox-theme 'gruvbox)
                                      (gen-my-theme-form 'firecode-theme 'firecode)
                                      (gen-my-theme-form 'firebelly-theme 'firebelly)
                                      (gen-my-theme-form 'darktooth-theme 'darktooth)
                                      (gen-my-theme-form 'hc-zenburn-theme 'hc-zenburn)
                                      (gen-my-theme-form 'jazz-theme 'jazz)
                                      (gen-my-theme-form 'mbo70s-theme 'mbo70s)
                                      (gen-my-theme-form 'niflheim-theme 'niflheim)
                                      (gen-my-theme-form 'noctilux-theme 'noctilux)
                                      (gen-my-theme-form 'nzenburn-theme 'nzenburn)
                                      (gen-my-theme-form 'stekene-dark-theme 'stekene-dark)
                                      (gen-my-theme-form 'sublime-themes 'odersky)
                                      (gen-my-theme-form 'warm-night-theme 'warm-night)))

(eval (elt my-favourite-themes (random (length my-favourite-themes))))

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
         (global-set-key (kbd "<triple-wheel-left>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-wheel-left>") (lambda () (interactive) nil))
         (global-set-key (kbd "<wheel-left>") (lambda () (interactive) nil))
         (global-set-key (kbd "<triple-wheel-right>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-wheel-right>") (lambda () (interactive) nil))
         (global-set-key (kbd "<wheel-right>") (lambda () (interactive) nil))
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
