;; magit, helm ls git

(req-package helm-ls-git
             :require
             (helm magit)
             :init (global-set-key (kbd "M-+") 'helm-ls-git-ls))

;; dsvn

(req-package dsvn)

(provide 'init-vc)
