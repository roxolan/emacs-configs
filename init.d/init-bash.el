;; flymake shell

(req-package flymake-shell
  :require (flymake shell)
  :config (add-hook 'sh-set-shell-hook 'flymake-shell-load))

(provide 'init-bash)
