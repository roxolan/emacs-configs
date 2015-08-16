(require 'req-package)

;; cursor configuration

(setq-default cursor-type 'box)
(blink-cursor-mode 1)

;; use timeclock

(req-package timeclock
  :config (progn (timeclock-mode-line-display 1)
                 (add-hook 'kill-emacs-query-functions 'timeclock-query-out)))

;; highlight number in code

(req-package highlight-numbers
  :config (add-hook 'find-file-hook (lambda () (highlight-numbers-mode 1))))

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
  (list (if package package file)
        theme
        (append (list 'req-package file)
                (list :require 'smart-mode-line)
                (list :defer 2)
                (if package (list :ensure package) nil))))

(defconst my-favourite-themes (vector (gen-my-theme-form 'soothe-theme 'soothe)
                                      (gen-my-theme-form 'gotham-theme 'gotham)
                                      (gen-my-theme-form 'zerodark-theme 'zerodark)
                                      (gen-my-theme-form 'gruvbox-theme 'gruvbox)
                                      (gen-my-theme-form 'firecode-theme 'firecode)
                                      (gen-my-theme-form 'busybee-theme 'busybee)
                                      (gen-my-theme-form 'firebelly-theme 'firebelly)
                                      (gen-my-theme-form 'darktooth-theme 'darktooth)
                                      (gen-my-theme-form 'hc-zenburn-theme 'hc-zenburn)
                                      (gen-my-theme-form 'jazz-theme 'jazz)
                                      (gen-my-theme-form 'mbo70s-theme 'mbo70s)
                                      (gen-my-theme-form 'niflheim-theme 'niflheim)
                                      (gen-my-theme-form 'nzenburn-theme 'nzenburn)
                                      (gen-my-theme-form 'warm-night-theme 'warm-night)
                                      (gen-my-theme-form 'odersky-theme 'odersky 'sublime-themes)
                                      (gen-my-theme-form 'brin-theme 'brin 'sublime-themes)
                                      (gen-my-theme-form 'junio-theme 'junio 'sublime-themes)
                                      (gen-my-theme-form 'wilson-theme 'wilson 'sublime-themes)
                                      (gen-my-theme-form 'plan9-theme 'plan9)
                                      ))

(let ((theme-form (elt my-favourite-themes (random (length my-favourite-themes)))))
  (print (concat "selected theme: "
                 (symbol-name (car theme-form))
                 " : "
                 (symbol-name (car (cdr theme-form)))))
  (eval (car (cdr (cdr theme-form)))))

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

;; miscaleous tweeks

(setq make-pointer-invisible nil)

;; todo, fixme highlighting

(req-package fic-mode
  :config
  (add-hook 'prog-mode-hook (lambda () (fic-mode 1))))

(req-package rainbow-delimiters
  :require clojure-mode
  :commands rainbow-delimiters-mode
  :init (progn (custom-set-variables '(rainbow-delimiters-max-face-count 8))
               (custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:inherit org-level-1)))))
               (custom-set-faces '(rainbow-delimiters-depth-2-face ((t (:inherit org-level-2)))))
               (custom-set-faces '(rainbow-delimiters-depth-3-face ((t (:inherit org-level-3)))))
               (custom-set-faces '(rainbow-delimiters-depth-4-face ((t (:inherit org-level-4)))))
               (custom-set-faces '(rainbow-delimiters-depth-5-face ((t (:inherit org-level-5)))))
               (custom-set-faces '(rainbow-delimiters-depth-6-face ((t (:inherit org-level-6)))))
               (custom-set-faces '(rainbow-delimiters-depth-7-face ((t (:inherit org-level-7)))))
               (custom-set-faces '(rainbow-delimiters-depth-8-face ((t (:inherit org-level-8)))))
               (add-hook 'emacs-lisp-mode-hook (lambda () (rainbow-delimiters-mode 1)))
               (add-hook 'clojure-mode-hook (lambda () (rainbow-delimiters-mode 1)))))

;; diff highlight

(req-package diff-hl
  :require smartrep
  :config (global-diff-hl-mode 1))

(provide 'init-look-and-feel)
