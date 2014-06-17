;; magit

(req-package magit :commands magit-status)

;; magit svn

(req-package magit-svn :require magit)

;; magit github integration

(req-package magithub
  :require magit
  :disabled t)

;; helm ls git

(req-package helm-ls-git
  :require
  helm
  :config (global-set-key (kbd "M-+") 'helm-ls-git-ls))

;; git config mode

(req-package gitconfig-mode)

;; git ignore mode

(req-package gitignore-mode)

;; git message

(req-package git-messenger
  :commands git-messenger:popup-message
  :bind ("C-x v p" . git-messenger:popup-message))

;; git blame

(req-package git-blame)

;; git attributes editing

(req-package gitattributes-mode)

;; tweak ediff

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(provide 'init-vc)
