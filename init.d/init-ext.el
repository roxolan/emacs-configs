;; howdoi

(req-package howdoi)

;; swoop

(req-package swoop)

;; save history

(req-package savehist
  :init (savehist-mode 1))

;; go to last change

(req-package goto-last-change
  :init
  (global-set-key (kbd "C-x C-\\") 'goto-last-change))

;; sudo support

(req-package sudo-ext)

;; shell command

(req-package shell-command)

;; hide/show comments

(req-package hide-comnt
  :init
  (global-set-key (kbd "C-c h") 'hide/show-comments-toggle))

;; scratch persist

(req-package scratch-persist)

;; scratch ext

(req-package scratch-ext)

;; insert shebang

(req-package insert-shebang
  :init
  (add-hook 'find-file-hook 'insert-shebang))

;; indentation

(setq-default tab-width 4)
(add-hook 'find-file-hook (lambda () (setq indent-tabs-mode nil)))
(electric-indent-mode 1)

;; mark ring tweaks

(setq set-mark-command-repeat-pop t)

;; save bookmarks on emacs exit

(setq bookmark-save-flag 1)

;; delete trailing whitespaces before saving some buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; turn off backup files

(setq make-backup-files nil)

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

;; ace jump mode

(req-package ace-jump-mode
  :init (progn (define-key global-map (kbd "M-/") 'ace-jump-word-mode)
               (define-key global-map (kbd "s-c") 'ace-jump-char-mode)
               (define-key global-map (kbd "M-g M-g") 'ace-jump-line-mode)))

;; ace jump buffer

(req-package ace-jump-buffer
  :require (shell ace-jump-mode)
  :init (progn (define-key shell-mode-map (kbd "M-?") 'ace-jump-buffer)
               (define-key global-map (kbd "M-?") 'ace-jump-buffer)))

;; move text

(req-package move-text
  :init (progn (global-set-key (kbd "M-n") 'move-text-down)
               (global-set-key (kbd "M-p") 'move-text-up)))

;; duplicate thing

(req-package duplicate-thing
  :init (progn (global-set-key (kbd "M-c") 'duplicate-thing)
               (global-set-key (kbd "M-с") 'duplicate-thing)))

;; auto pair

(req-package autopair
  :init (add-hook 'prog-mode-hook (lambda () (autopair-mode 1))))

;; auto reverting

(req-package autorevert
  :init (progn (setq global-auto-revert-non-file-buffers t)
               (setq auto-revert-interval 0.5)
               (add-to-list 'auto-mode-alist
                            '("\\.log\\'" . auto-revert-tail-mode))))

;; god mode

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'hollow 'box)))

(req-package god-mode
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

;; auto complete

(req-package auto-complete
  :init (progn (require 'auto-complete-config)
               (global-auto-complete-mode t)
               (setq ac-auto-start 1)
               (setq ac-quick-help-delay 0.1)
               (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)))

;; flymake

(req-package flymake
  :init (progn (add-hook 'find-file-hook 'flymake-find-file-hook)
               (global-set-key (kbd "<f2>") 'flymake-goto-prev-error)
               (global-set-key (kbd "<f3>") 'flymake-goto-next-error)
               (setq flymake-gui-warnings-enabled nil)
               (setq flymake-log-level 0)))

(req-package flymake-cursor
  :require flymake)

;; yasnippet

(req-package yasnippet
  :init (yas-global-mode 1))

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

(provide 'init-ext)
