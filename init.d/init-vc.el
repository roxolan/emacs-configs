;; magit, helm ls git

(req-package helm-ls-git
             :require
             (helm magit)
             :ensure
             helm-ls-git
             :init (global-set-key (kbd "M-+") 'helm-ls-git-ls))

;; dsvn

(req-package dsvn
             :require
             vc-svn
             :ensure
             dsvn)

(provide 'init-vc)
