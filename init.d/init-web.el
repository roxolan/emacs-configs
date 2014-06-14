;; http repl

(req-package httprepl
  :require (s dash))

;; restclient

(req-package restclient)

;; elnode

(req-package elnode
  :disabled t)

;; pick mode

(req-package peek-mode
  :require elnode
  :disabled t
  :init (elnode-start 'peek-mode-dispatcher-handler :port 8008 :host "localhost"))

;; xml generation dsl

(req-package xmlgen)

;; html templates editing

(req-package web-mode)

(provide 'init-web)
