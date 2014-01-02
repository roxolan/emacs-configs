;; magit

(req-package magit)

;; magit svn

(req-package magit-svn)

;; helm ls git

(req-package helm-ls-git
             :require
             helm
             :init (global-set-key (kbd "M-+") 'helm-ls-git-ls))

;; dsvn

(req-package dsvn)

;; git config mode

(req-package gitconfig-mode)

;; git ignore mode

(req-package gitignore-mode)

(provide 'init-vc)
