;; svn integration

(req-package psvn
  :commands svn-status)

;; use timemachine

(req-package git-timemachine)

;; magit

(req-package magit :commands magit-status)

;; git flow

(req-package magit-gitflow
  :require magit
  :config (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

;; magit svn

(req-package magit-svn :require magit)

;; magit github integration

(req-package magithub
  :require magit
  :disabled t)

;; helm ls git

(req-package helm-ls-git
  :require helm
  :bind ("M-+" . helm-ls-git-ls))

;; git config mode

(req-package gitconfig-mode)

;; git ignore mode

(req-package gitignore-mode)

;; git message

(req-package git-messenger
  :bind ("C-x v p" . git-messenger:popup-message))

;; git blame

(req-package git-blame)

;; git attributes editing

(req-package gitattributes-mode)

;; tweak ediff

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(provide 'init-vc)
