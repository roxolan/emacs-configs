
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

;;

(setq tab-width 4)
(setq default-tab-width 4)

;; auto complete config

(add-to-list 'load-path "~/.emacs.d/elpa/popup-20130117.1954")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20130209.651")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130122.1551/dict")
(ac-config-default)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-clang-20120612.2224")
(require 'auto-complete-clang)

(setq ac-quick-help-delay 0.5)
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
(defun cc-mode-clang-hook ()
  (setq ac-sources (append '(ac-source-clang) ac-sources)))

(add-hook 'c-mode-common-hook 'cc-mode-clang-hook)

(global-auto-complete-mode t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; popup kill ring

(add-to-list 'load-path "~/.emacs.d/elpa/pos-tip-20121128.2315")
(add-to-list 'load-path "~/.emacs.d/")
(require 'popup-kill-ring)

(global-set-key (kbd "C-x p") 'popup-kill-ring)
(global-set-key (kbd "C-ч з") 'popup-kill-ring)

;; find-file-in-project

(add-to-list 'load-path "~/.emacs.d/elpa/find-file-in-project-20120716.1655")
(require 'find-file-in-project)

(global-set-key (kbd "C-x f") 'find-file-in-project)
(global-set-key (kbd "C-ч а") 'find-file-in-project)

;; lua mode

(add-to-list 'load-path "~/.emacs.d/elpa/lua-mode-20120919.1821")
(require 'lua-mode)
(require 'lua-mode-autoloads)

;; flymake lua

(add-to-list 'load-path "~/.emacs.d/elpa/flymake-lua-1.0/")
(require 'flymake-lua)
(require 'flymake-lua-autoloads)

(add-hook 'lua-mode-hook 'flymake-lua-load)

;; glsl

(add-to-list 'load-path "~/.emacs.d/glsl-mode")
(require 'glsl-mode)

(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))

(setq glsl-other-file-alist
      '(("\\.fs$" (".vs"))
	("\\.vs$" (".fs")))
)

;; gist integration

(add-to-list 'load-path "~/.emacs.d/elpa/gh-20121231.208")
(add-to-list 'load-path "~/.emacs.d/elpa/pcache-20120408.1206")
(add-to-list 'load-path "~/.emacs.d/elpa/logito-20120225.2155")
(add-to-list 'load-path "~/.emacs.d/gist")
(require 'gist)

;; yasnippet

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20130112.1823")
(require 'yasnippet)
(require 'yasnippet-autoloads)

(yas--initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20130112.1823/snippets")

;; haskell mode

(add-to-list 'load-path "~/.emacs.d/haskell-mode")
(require 'haskell-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; platform depended

(require 'init-platform-dependent)
(init-platform-dependent-start)

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
