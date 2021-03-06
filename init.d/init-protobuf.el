(require 'req-package)

(req-package protobuf-mode
  :require (flycheck flycheck-protobuf)
  :mode(("proto\\'" . protobuf-mode))
  :config (req-package-hooks-add-execute 'protobuf-mode
            (lambda () (flycheck-select-checker 'protobuf-protoc-reporter))))

(provide 'init-protobuf)
