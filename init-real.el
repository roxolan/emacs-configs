;; customizations

(setq tab-width 4)
(setq default-tab-width 4)

(setq mark-ring-max 4)
(setq global-mark-ring-max 8)
(setq set-mark-command-repeat-pop t)

(setq bookmark-save-flag 1)

(setq scroll-preserve-screen-position t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq display-time-day-and-date t)
(display-time)

(setq make-pointer-invisible nil)

(setq isearch-allow-scroll t)

(setq make-backup-files nil)

(defun auto-revert-mode-enabler () (auto-revert-mode 1))
(add-hook 'dired-mode-hook 'auto-revert-mode-enabler)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-interval 1)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq mouse-autoselect-window t)

(setq-default major-mode 'text-mode)

(column-number-mode 1)

(electric-indent-mode 1)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(global-ede-mode t)

;; auto complete

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130122.1551/dict")

(require 'auto-complete-clang)
(setq ac-auto-start 1)
(setq ac-quick-help-delay 0.5)
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
(defun cc-mode-clang-hook ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(add-hook 'c-mode-common-hook 'cc-mode-clang-hook)
(add-hook 'c-mode-common-hook 'ac-flyspell-workaround)

(global-auto-complete-mode t)
(define-key ac-mode-map  [(control tab)] 'auto-complete)

(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

;; flymake c++ clang

(require 'flymake)
(require 'flymake-clang-c++)

(add-hook 'c-mode-common-hook 'flymake-clang-c++-load)

;; gdb

(setq gdb-many-windows t)
(setq gdb-show-main t)

;; lua mode

(require 'lua-mode)
(require 'lua-mode-autoloads)

;; flymake lua

(require 'flymake-lua)
(require 'flymake-lua-autoloads)

(add-hook 'lua-mode-hook 'flymake-lua-load)

;; glsl

(require 'glsl-mode)

(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))

(setq glsl-other-file-alist
      '(("\\.fs$" (".vs"))
	("\\.vs$" (".fs")))
)

;; gist integration

(require 'gist)

;; yasnippet

(require 'yasnippet)
(require 'yasnippet-autoloads)

(yas--initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20130218.2229/snippets/")

;; haskell mode

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

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

;; popup kill ring

(require 'popup-kill-ring)
(global-set-key (kbd "C-x p") 'popup-kill-ring)
(global-set-key (kbd "C-ч з") 'popup-kill-ring)

;; find-file-in-project

(global-set-key (kbd "C-x f") 'find-file-in-project)
(global-set-key (kbd "C-ч а") 'find-file-in-project)

;; platform depended

(require 'init-platform-dependent)
(init-platform-dependent-start)
