(require 'req-package)

(req-package protobuf-mode
  :require flycheck
  :mode (("proto\\'" . protobuf-mode))
  :config
  (progn
    (flycheck-define-checker protobuf-protoc-reporter
      "A protobuf syntax checker based on protoc compiler"
      :command ("protoc" "--error_format" "gcc" "--java_out=/tmp" "--proto_path" source-directory source-inplace)
      :error-patterns
      ((error line-start
              (message "In file included from") " " (file-name) ":" line ":"
              column ":"
              line-end)
       (info line-start (file-name) ":" line ":" column
             ": note: " (message) line-end)
       (error line-start (file-name) ":" line ":" column
              ": " (message) line-end))
      :modes (protobuf-mode))
    (add-hook 'protobuf-mode-hook (lambda () (flycheck-select-checker 'protobuf-protoc-reporter)))))

(provide 'init-protobuf)
