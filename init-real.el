;; save installed packages on exit

(require 'save-packages-autoloads)
(add-hook 'kill-emacs-hook 'save-packages)

;; theme

(if (display-graphic-p)
	(load-theme 'tango-dark t nil))

;; customizations

(menu-bar-mode -1)

;; toolbar

(tool-bar-mode -1)

;; scroll bar

(require 'scroll-bar)
(scroll-bar-mode -1)

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

(require 'dired)
(require 'dired-single-autoloads)
(define-key dired-mode-map (kbd "f") 'dired-single-buffer)
(define-key dired-mode-map (kbd "<RET>") 'dired-single-buffer)
(define-key dired-mode-map (kbd "^") (function (lambda () (interactive) (dired-single-buffer ".."))))

;; delete trailing whitespaces before saving some buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook (lambda () (tabify (point-min) (point-max))))

;; mode line tweaks

(column-number-mode 1)

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

;; focus follows mouse

(setq mouse-autoselect-window t)

;; deafult mode for text editing

(setq-default major-mode 'text-mode)

;; turn off sctartup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; disable defining variables in files

(setq enable-local-variables nil)

;; miscaleous tweeks

(setq make-pointer-invisible nil)

;; xml

(setq-default nxml-child-indent 4)
(require 'auto-complete-nxml)

;; auto byte compile elisp on save

(autoload 'enable-auto-async-byte-compile-mode "auto-async-byte-compile")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; auto complete

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")

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

(require 'auto-complete-clang)
(setq ac-auto-start 1)
(setq ac-quick-help-delay 0.5)
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))

(defun cc-mode-clang-hook ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))
  (setq ac-clang-flags
		(mapcar (lambda (item) (concat "-I" item))
				(split-string (shell-command-to-string "bash ~/.emacs.d/clang-include-paths.sh"))))
  (setq ac-clang-flags (append ac-clang-flags
							   (mapcar 'expand-include-flag
									   (split-string (shell-command-to-string (concat (concat "make -C " (find-makefile-dir "./")) " -s print-cflags"))))))
  (ac-cc-mode-setup))


(global-auto-complete-mode t)

(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(add-hook 'c-mode-common-hook 'cc-mode-clang-hook)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; gdb

(setq gdb-many-windows t)
(setq gdb-show-main t)

;; scala mode

(require 'scala-mode2-autoloads)

;; lua mode

(require 'lua-mode-autoloads)
(setq lua-indent-level 4)

;; js2 mode

(require 'js2-mode-autoloads)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; flymake

(autoload 'flymake-find-file-hook "flymake")
(autoload 'flymake-goto-prev-error "flymake")
(autoload 'flymake-goto-next-error "flymake")
(add-hook 'find-file-hook 'flymake-find-file-hook)
(global-set-key (kbd "<f2>") 'flymake-goto-prev-error)
(global-set-key (kbd "<f3>") 'flymake-goto-next-error)

(require 'flymake-cursor-autoloads)

;; flymake lua

(require 'flymake-lua-autoloads)
(add-hook 'lua-mode-hook 'flymake-lua-load)

;; flymake shell

(require 'flymake-shell-autoloads)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)

;; flymake haskell

(require 'flymake-haskell-multi-autoloads)
(add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)

;; glsl

(autoload 'glsl-mode "glsl-mode")
(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))
(setq glsl-other-file-alist
	  '(("\\.fs$" (".vs"))
		("\\.vs$" (".fs")))
)

;; yasnippet

(require 'yasnippet-autoloads)
(add-hook 'prog-mode-hook (lambda () (yas-minor-mode 1)))

;; haskell mode

(require 'haskell-mode-autoloads)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; smooth mouse scroll

(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse t) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq auto-window-vscroll nil)
(setq scroll-preserve-screen-position t)
(setq isearch-allow-scroll t)

;; line numbers

(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d|")

;; line highlight

(global-hl-line-mode 1)
(setq hl-line-face 'ediff-odd-diff-A)

;; todo, fixme highlighting

(require 'fic-mode-autoloads)
(add-hook 'prog-mode-hook (lambda () (fic-mode 1)))

;; move text

(require 'move-text-autoloads)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "M-p") 'move-text-up)

;; duplicate thing

(require 'duplicate-thing-autoloads)
(global-set-key (kbd "M-c") 'duplicate-thing)
(global-set-key (kbd "M-с") 'duplicate-thing)

;; auto pair

(require 'autopair-autoloads)
(add-hook 'prog-mode-hook (lambda () (autopair-mode 1)))

;; highlight parenthesis

(require 'highlight-parentheses-autoloads)
(add-hook 'prog-mode-hook (lambda () (highlight-parentheses-mode 1)))

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

;; popup kill ring

(autoload 'popup-kill-ring "popup-kill-ring")
(global-set-key (kbd "C-x p") 'popup-kill-ring)
(global-set-key (kbd "C-ч з") 'popup-kill-ring)

;; jumping to lines

(global-set-key (kbd "C-x C-l") 'goto-line)
(global-set-key (kbd "C-ч C-д") 'goto-line)

;; platform depended

(cond ((eq system-type 'darwin) (require 'init-platform-dependent-darwin))
	  ((eq system-type 'windows-nt) (require 'init-platform-dependent-windows-nt))
	  ((eq system-type 'gnu/linux) (require 'init-platform-dependent-gnu-linux)))

(init-platform-dependent-start)

;; start emacs server

(server-start)
