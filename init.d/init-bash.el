(require 'req-package)

(req-package bash-completion
  :disabled t
  :require shell
  :commands bash-completion-dynamic-complete
  :init
  (setq explicit-shell-file-name "bash")
  (setq comint-process-echoes t)
  (req-package-hooks-add-execute-impl 'shell-mode 'shell-dynamic-complete-functions
    'bash-completion-dynamic-complete)
  (req-package-hooks-add-execute-impl 'shell-mode 'shell-command-complete-functions
    'bash-completion-dynamic-complete))

(req-package shell-pop
  :require key-chord
  :bind ("M-\"" . shell-pop))

(provide 'init-bash)
