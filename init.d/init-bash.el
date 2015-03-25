;; flymake shell

(req-package flymake-shell
  :require (flymake shell)
  :config (add-hook 'sh-set-shell-hook 'flymake-shell-load))

(req-package bash-completion
  :require shell
  :commands bash-completion-dynamic-complete
  :init (progn (setq explicit-shell-file-name "bash")
			   (setq comint-process-echoes t)
			   (add-hook 'shell-dynamic-complete-functions 'bash-completion-dynamic-complete)
			   (add-hook 'shell-command-complete-functions 'bash-completion-dynamic-complete)))

(req-package shell-pop
  :require key-chord
  :bind ("C-`" . shell-pop)
  :init (key-chord-define-global "``" 'shell-pop))

(req-package shell-command)

(provide 'init-bash)
