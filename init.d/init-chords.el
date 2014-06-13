;; key chord mode

(req-package key-chord
  :require dired
  :init (progn (key-chord-mode 1)
			   (key-chord-define-global "qq" 'kill-this-buffer)
			   (key-chord-define dired-mode-map "qq" 'dired-up-directory)))

(provide 'init-chords)
