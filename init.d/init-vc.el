;; magit

(req-package magit)

;; helm ls git

(req-package helm-ls-git
             :require
             helm
             :init (global-set-key (kbd "M-+") 'helm-ls-git-ls))

;; dsvn

(req-package dsvn)

(provide 'init-vc)
