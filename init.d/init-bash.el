;; bash complete

(req-package bash-completion
  :require auto-complete
  :config (bash-completion-setup))

;; flymake shell

(req-package flymake-shell
  :require (flymake shell)
  :config (add-hook 'sh-set-shell-hook 'flymake-shell-load))

(provide 'init-bash)
