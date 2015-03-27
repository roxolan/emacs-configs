;; ido mode

(req-package ido-better-flex
  :require key-chord
  :config (progn (ido-mode 1)
				 (ido-everywhere 1)
				 (ido-better-flex/enable)
				 (global-set-key (kbd "C-x C-f") 'ido-find-file)
				 (key-chord-define-global ";f" 'ido-find-file)
				 (key-chord-define-global "xb" 'ido-switch-buffer)))

(req-package ido-at-point
  :config (ido-at-point-mode 1))
