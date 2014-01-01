;; helm

(req-package helm
             :init
             (progn (require 'helm-config)
                    (define-key global-map (kbd "C-x b") 'helm-buffers-list)))

;; helm ac

(req-package ac-helm
             :require
             (helm auto-complete)
             :init
             (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm))

;; helm helm commands

(req-package helm-helm-commands
             :require helm)

;; helm swoop

(req-package helm-swoop
             :require
             helm
             :init
             (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch))

;; helm flymake

(req-package helm-flymake
             :require
             (helm flymake))

(provide 'init-helm)
