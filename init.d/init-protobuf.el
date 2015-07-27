(require 'req-package)

(flycheck-define-checker protobuf-protoc-reporter
  "A protobuf syntax checker based on protoc compiler"
  :command ("/Users/eduardk/.emacs.d/check-protoc.sh" source-inplace)
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

(req-package protobuf-mode
  :mode (("proto\\'" . protobuf-mode))
  :config (add-hook 'protobuf-mode-hook (lambda () (flycheck-select-checker 'protobuf-protoc-reporter))))
