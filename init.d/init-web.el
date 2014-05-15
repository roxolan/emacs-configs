;; http repl

(req-package httprepl
  :require (s dash))

;; restclient

(req-package restclient)

;; elnode

(req-package elnode)

;; pick mode

(req-package peek-mode
  :require elnode
  :init (elnode-start 'peek-mode-dispatcher-handler :port 8008 :host "localhost"))

;; xml generation dsl

(req-package xmlgen)

(provide 'init-web)
