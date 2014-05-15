;; helm

(req-package helm
  :init
  (progn (require 'helm-config)
         (define-key global-map (kbd "C-x b") 'helm-buffers-list)
         (global-set-key (kbd "C-c y") 'helm-show-kill-ring)
         (global-set-key (kbd "C-x r l") 'helm-bookmarks)))

;; helm google

(req-package helm-google
  :require helm)

;; helm proc

(req-package helm-proc
  :require helm)

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

;; helm desc binds

(req-package helm-descbinds
  :require
  helm)

;; helm package

(req-package helm-package
  :require
  helm)

;; helm flymake

(req-package helm-flymake
  :require
  (helm flymake))

;; helm make

(req-package helm-make
  :require
  helm
  :init
  (global-set-key (kbd "s-B") 'helm-make))

;; helm wgrep

(req-package wgrep-helm
  :require
  (helm wgrep grep))

;; helm github stars

(req-package helm-github-stars
  :require helm
  :init (setq helm-github-stars-username (getenv "USER")))

(provide 'init-helm)
