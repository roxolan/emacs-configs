(require 'req-package)

(req-package flycheck-protobuf
  :require flycheck
  :config (add-to-list 'flycheck-checkers 'protobuf-protoc-reporter t))

(req-package protobuf-mode
  :require flycheck-protobuf
  :mode(("proto\\'" . protobuf-mode)))

(provide 'init-protobuf)
