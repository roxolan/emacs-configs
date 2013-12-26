;; helm

(req-package helm
             :ensure helm
             :init (progn (require 'helm-config)
                          (define-key global-map (kbd "C-x b") 'helm-buffers-list)))

;; use helm helm commands

(req-package helm-helm-commands
             :require helm
             :ensure helm-helm-commands)

;; helm ac

(req-package ac-helm
             :require (helm auto-complete)
             :ensure ac-helm
             :init (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm))

;; helm helm commands

(req-package helm-helm-commands
             :require helm
             :ensure helm-helm-commands)

;; helm swoop

(req-package helm-swoop
             :require helm
             :ensure helm-swoop
             :init (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch))

(provide 'init-helm)
