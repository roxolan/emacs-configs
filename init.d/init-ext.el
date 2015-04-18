(req-package twittering-mode
  :commands twit
  :config (progn (setq twittering-icon-mode t)
                 (setq twittering-use-icon-storage t)
                 (setq twittering-timeline-spec-alias '(("Clojure" . "edvorg/clojure")
                                                        ("BMX" . "edvorg/bmx1")
                                                        ("Emacs" . "edvorg/emacs1")
                                                        ("Guys" . "edvorg/guys")
                                                        ("JVM" . "edvorg/jvm")))
                 (setq twittering-use-master-password t)
                 (twittering-enable-unread-status-notifier)))

(req-package multifiles
  :bind ("C-!" . mf/mirror-region-in-multifile))

;; zoom frame

(req-package zoom-frm
  :commands zoom-in/out
  :init (progn (define-key ctl-x-map [(control ?+)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?-)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?=)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?0)] 'zoom-in/out)))

;; camcoder

(req-package camcorder :commands camcorder-record)

;; edit server

(req-package edit-server
  :config (edit-server-start))

;; emacs bugtracker

(req-package debbugs)

;; open recent files

(req-package recentf
  :config (recentf-mode 1))

;; use hungry delete

(req-package hungry-delete
  :config (global-hungry-delete-mode 1))

;; spray reading mode

(req-package spray :bind ("<f6>" . spray-mode))

;; revertible delete other windows

(req-package zygospore
  :require key-chord
  :commands zygospore-toggle-delete-other-windows
  :init (key-chord-define-global ";1" 'zygospore-toggle-delete-other-windows))

;; delete trailing whitespaces before saving some buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; temp file

(req-package find-temp-file
  :bind ("C-x C-t" . find-temp-file))

;; narrow region to other window

(req-package narrow-indirect)

;;  folding

(req-package origami
  :init (add-hook 'prog-mode-hook (lambda () (origami-mode 1)))
  :commands origami-mode
  :bind (("C-c <C-S-return>" . origami-toggle-all-nodes)
         ("C-c <C-return>" . origami-recursively-toggle-node)))

;; shit text left/right

(req-package smart-shift
  :bind (("C-{" . smart-shift-left)
         ("C-}" . smart-shift-right)))

;; save kill ring to disk

(req-package savekill
  :config (progn (setq savekill-max-saved-items nil)
                 (load save-kill-file-name t)))

;; google tanslate

(req-package google-translate
  :init (require 'google-translate-smooth-ui)
  :bind ("C-c t" . google-translate-smooth-translate))

;; swith off some warnings

(req-package warnings
  :config (add-to-list 'warning-suppress-types '(undo discard-info)))

;; smart wthitespace cleanup

(req-package whitespace-cleanup-mode
  :config (global-whitespace-cleanup-mode 1))

;; use fuzzy for M-x

(req-package smex
  :require key-chord
  :bind ("M-x" . smex)
  :config (smex-initialize)
  :init (key-chord-define-global "xm" 'smex))

;; googling

(req-package google-this)

;; string edit

(req-package string-edit
  :config (global-set-key (kbd "C-c e") 'string-edit-at-point))

;; paradox

(req-package paradox
  :require key-chord
  :commands paradox-list-packages
  :init (key-chord-define-global ";p" 'paradox-list-packages))

;; multiple cursors

(req-package multiple-cursors
  :config (progn (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
                 (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
                 (global-set-key (kbd "C->") 'mc/mark-next-like-this)
                 (global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)))

;; ant

(req-package ant)

;; save packages

(req-package save-packages
  :config
  (progn (setq save-packages-file "~/.emacs.d/saved-packages")
         (add-hook 'kill-emacs-hook 'save-packages)))

;; sos

(req-package sos :commands sos)

;; howdoi

(req-package howdoi)

;; swoop

(req-package swoop)

;; save history

(req-package savehist
  :config (savehist-mode 1))

;; go to last change

(req-package goto-last-change
  :config
  (global-set-key (kbd "C-x C-\\") 'goto-last-change))

;; sudo support

(req-package sudo-ext)

;; scratch persist

(req-package scratch-persist
  :require (eldoc hl-defined scratch-ext))

;; scratch ext

(req-package scratch-ext)

;; indentation

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(add-hook 'find-file-hook (lambda () (setq indent-tabs-mode nil)))
(electric-indent-mode 1)

;; mark ring tweaks

(setq set-mark-command-repeat-pop t)

;; save bookmarks on emacs exit

(setq bookmark-save-flag 1)

;; do not use dialog boxes

(setq use-dialog-box nil)

;; enable upcase and downcase region commands

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; enable narrowing

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; default mode for text editing

(setq-default major-mode 'text-mode)

;; disable defining variables in files

(setq enable-local-variables nil)

;; simplify yes or no

(defalias 'yes-or-no-p 'y-or-n-p)

;; switch window

(req-package switch-window
  :require key-chord
  :bind ("C-x o" . switch-window)
  :init (key-chord-define-global ";o" 'switch-window))

;; ace jump mode

(req-package ace-jump-mode
  :bind (("M-/" . ace-jump-word-mode)
         ("s-c" . ace-jump-char-mode)
         ("M-g M-g" . ace-jump-line-mode)))

;; ace jump buffer

(req-package ace-jump-buffer
  :require (shell)
  :bind ("M-?" . ace-jump-buffer))

;; move text

(req-package move-text
  :config (progn (global-set-key (kbd "M-n") 'move-text-down)
                 (global-set-key (kbd "M-p") 'move-text-up)))

;; duplicate thing

(req-package duplicate-thing
  :config (progn (global-set-key (kbd "M-c") 'duplicate-thing)))

;; smart parenthesis

(req-package smartparens-config
  :require smartparens
  :config (progn (smartparens-global-mode t)
                 (show-smartparens-global-mode t)))

;; auto reverting

(req-package autorevert
  :config (progn (setq global-auto-revert-non-file-buffers t)
                 (setq auto-revert-interval 0.5)
                 (add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))))

;; shrink/enlarge window

(global-set-key (kbd "s-{") (lambda () (interactive) (shrink-window 10 1)))
(global-set-key (kbd "s-}") (lambda () (interactive) (enlarge-window 10 1)))
(global-set-key (kbd "s-?") (lambda () (interactive) (shrink-window 5 nil)))
(global-set-key (kbd "s-\"") (lambda () (interactive) (enlarge-window 5 nil)))
(global-set-key (kbd "s-]") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "s-[") (lambda () (interactive) (other-window -1)))

;; ru keys

(add-hook 'find-file-hook (lambda () (setq default-input-method 'russian-computer)))

;; expand region

(req-package expand-region
  :require key-chord
  :init (key-chord-define-global "xx" 'er/expand-region)
  :bind ("C-=" . er/expand-region))

;; desc unbound keys

(req-package unbound)

;; rotate

(req-package rotate
  :config
  (global-set-key (kbd "s-P") 'rotate-layout))

(provide 'init-ext)
