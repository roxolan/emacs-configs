;; http repl

(req-package httprepl
  :require (s dash))

;; restclient

(req-package restclient)

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

(req-package web-mode :commands web-mode)

(provide 'init-web)
