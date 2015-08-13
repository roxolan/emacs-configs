(require 'req-package)

(req-package protobuf-mode
  :require (flycheck flycheck-protobuf)
  :mode(("proto\\'" . protobuf-mode))
  :config (add-hook 'protobuf-mode-hook (lambda () (flycheck-select-checker 'protobuf-protoc-reporter))))

(provide 'init-protobuf)
