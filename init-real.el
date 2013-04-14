;; theme

(load-theme 'sea-before-storm t nil)

;; customizations

;; toolbar

(tool-bar-mode -1)

;; indentation

(setq-default tab-width 4)

(electric-indent-mode 1)

;; mark ring tweaks

(setq mark-ring-max 4)
(setq global-mark-ring-max 8)
(setq set-mark-command-repeat-pop t)

;; save bookmarks on emacs exit

(setq bookmark-save-flag 1)

;; delete trailing whitespaces before saving some buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; mode line tweaks

(setq display-time-day-and-date t)
(display-time)

(column-number-mode 1)

;; turn off backup files

(setq make-backup-files nil)

;; auto reverting dired buffer

(defun auto-revert-mode-enabler () (auto-revert-mode 1))
(add-hook 'dired-mode-hook 'auto-revert-mode-enabler)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-interval 1)

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

(require 'nxml-mode)
(setq-default nxml-child-indent 4)

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

;; diff highlighting

(require 'diff-hl)

(global-diff-hl-mode 1)

;; gdb

(setq gdb-many-windows t)
(setq gdb-show-main t)

;; lua mode

(require 'lua-mode)
(require 'lua-mode-autoloads)

;; flymake

(require 'flymake)

;; flymake c++

(add-hook 'c++-mode-hook (lambda () (flymake-mode 1)))

;; flymake lua

(require 'flymake-lua)

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
(yas-global-mode 1)

;; haskell mode

(require 'haskell-mode)
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

;; highlight line

(require 'hl-line+)
(global-hl-line-mode 1)

;; line numbers

(add-hook 'prog-mode-hook (lambda () (linum-mode 1)))
(setq linum-format "%3d|")

;; todo, fixme highlighting

(require 'fic-mode)
(add-hook 'prog-mode-hook 'turn-on-fic-mode)

;; move text

(require 'move-text)
(move-text-default-bindings)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "M-p") 'move-text-up)

;; auto pair

(require 'autopair)
(autopair-global-mode 1)

;; highlight parenthesis

(require 'highlight-parentheses)
(add-hook 'prog-mode-hook (lambda () (highlight-parentheses-mode 1)))

;; google translate

(require 'google-translate)
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "ru")
(global-set-key (kbd "C-x C-g") 'google-translate-at-point)
(global-set-key (kbd "C-ч C-п") 'google-translate-at-point)
(global-set-key (kbd "C-x g") 'google-translate-query-translate)
(global-set-key (kbd "C-ч п") 'google-translate-query-translate)

;; mail

(setq user-full-name "edward e. knyshov")
(setq user-mail-address "edvorg@gmail.com")
(setq mail-from-style 'angles)

;; hardcore mode

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-unset-key (kbd "M-DEL"))
(require 'hardcore-mode)
(global-hardcore-mode)

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

;; popup kill ring

(require 'popup-kill-ring)
(global-set-key (kbd "C-x p") 'popup-kill-ring)
(global-set-key (kbd "C-ч з") 'popup-kill-ring)

;; jumping to lines

(global-set-key (kbd "C-x C-l") 'goto-line)
(global-set-key (kbd "C-ч C-д") 'goto-line)

;; platform depended

(require 'init-platform-dependent)
(init-platform-dependent-start)

;; start emacs server

(server-start)
