(require 'req-package)

(req-package flycheck-protobuf
  :require flycheck)

(req-package protobuf-mode
  :require flycheck-protobuf
  :mode(("proto\\'" . protobuf-mode))
  :config (add-hook 'protobuf-mode-hook
                    (lambda ()
                      (flycheck-select-checker 'protobuf-protoc-reporter))))

(provide 'init-protobuf)
