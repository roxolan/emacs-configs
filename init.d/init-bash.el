(require 'req-package)

(req-package bash-completion
  :require shell
  :commands bash-completion-dynamic-complete
  :init (progn (setq explicit-shell-file-name "bash")
			   (setq comint-process-echoes t)
			   (req-package-add-hook-execute-impl 'shell-mode 'shell-dynamic-complete-functions
                 'bash-completion-dynamic-complete)
			   (req-package-add-hook-execute-impl 'shell-mode 'shell-command-complete-functions
                 'bash-completion-dynamic-complete)))

(req-package shell-pop
  :require key-chord
  :bind ("C-`" . shell-pop)
  :init (key-chord-define-global "``" 'shell-pop))

(provide 'init-bash)
