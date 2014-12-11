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

(req-package zygospore :commands zygospore-toggle-delete-other-windows)

;; highlight number in code

(req-package highlight-numbers
  :config (add-hook 'find-file-hook (lambda () (highlight-numbers-mode 1))))

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
         ("C-c <C-return>" . origami-toggle-node)))

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
  :pre-load (require 'google-translate-smooth-ui)
  :bind ("C-c t" . google-translate-smooth-translate))

;; swith off some warnings

(req-package warnings
  :config (add-to-list 'warning-suppress-types '(undo discard-info)))

;; smart wthitespace cleanup

(req-package whitespace-cleanup-mode
  :config (global-whitespace-cleanup-mode 1))

;; use fuzzy for M-x

(req-package smex
  :bind ("M-x" . smex)
  :config (smex-initialize))

;; googling

(req-package google-this)

;; shell pop up

(req-package shell-pop
  :bind ("C-`" . shell-pop))

;; string edit

(req-package string-edit
  :config (global-set-key (kbd "C-c e") 'string-edit-at-point))

;; paradox

(req-package paradox :commands paradox-list-packages)

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

;; shell command

(req-package shell-command)

;; scratch persist

(req-package scratch-persist
  :require (eldoc hl-defined scratch-ext))

;; scratch ext

(req-package scratch-ext)

;; insert shebang

(req-package insert-shebang
  :commands insert-shebang
  :init (add-hook 'find-file-hook 'insert-shebang))

;; indentation

(setq-default tab-width 4)
(add-hook 'find-file-hook (lambda () (setq indent-tabs-mode t)))
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

;; focus follows mouse

(setq mouse-autoselect-window t)

;; default mode for text editing

(setq-default major-mode 'text-mode)

;; disable defining variables in files

(setq enable-local-variables nil)

;; simplify yes or no

(defalias 'yes-or-no-p 'y-or-n-p)

;; switch window

(req-package switch-window
  :require key-chord
  :bind ("C-x o" . switch-window))

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
                 (add-to-list 'auto-mode-alist
                              '("\\.log\\'" . auto-revert-tail-mode))))

;; flymake

(req-package flymake
  :config (progn ;; (add-hook 'find-file-hook 'flymake-find-file-hook)
                 (global-set-key (kbd "<f2>") 'flymake-goto-prev-error)
                 (global-set-key (kbd "<f3>") 'flymake-goto-next-error)
                 (setq flymake-gui-warnings-enabled nil)
                 (setq flymake-log-level 0)))

(req-package flymake-cursor
  :require flymake)

;; shrink/enlarge window

(global-set-key (kbd "s-{") (lambda () (interactive) (shrink-window 10 1)))
(global-set-key (kbd "s-}") (lambda () (interactive) (enlarge-window 10 1)))
(global-set-key (kbd "s-?") (lambda () (interactive) (shrink-window 5 nil)))
(global-set-key (kbd "s-\"") (lambda () (interactive) (enlarge-window 5 nil)))
(global-set-key (kbd "s-]") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "s-[") (lambda () (interactive) (other-window -1)))

;; ru keys

(add-hook 'find-file-hook
          (lambda () (setq default-input-method 'russian-computer)))

;; expand region

(req-package expand-region
  :require key-chord
  :init (key-chord-define-global "xx" 'er/expand-region)
  :bind ("C-=" . er/expand-region))

(provide 'init-ext)
