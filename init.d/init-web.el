(require 'req-package)

;; http repl

(req-package httprepl :require (s dash) :commands httprepl)

;; restclient

(req-package restclient :mode ("\\.rest\\'" . restclient-mode))

(req-package company-restclient
  :require (restclient company)
  :config (add-to-list 'company-backends 'company-restclient))

;; elnode

(req-package elnode :commands (elnode-stop elnode-start))

;; pick mode

(req-package peek-mode
  :commands peek-mode
  :require elnode
  :config (elnode-start 'peek-mode-dispatcher-handler :port 8008 :host "localhost"))

;; xml generation dsl

(req-package xmlgen)

;; html templates editing

(req-package emmet-mode
  :require (css-mode sgml-mode)
  :commands emmet-mode
  :init (progn (req-package-hooks-add-execute 'sgml-mode 'emmet-mode)
               (req-package-hooks-add-execute 'css-mode 'emmet-mode)))

;; (req-package web-mode :commands web-mode)

(provide 'init-web)
