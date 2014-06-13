;; key chord mode

(req-package key-chord
  :require (dired cc-mode god-mode)
  :init (progn (key-chord-define-global "qq" 'kill-this-buffer)
			   (key-chord-define-global "qw" 'kill-this-buffer)
			   (key-chord-define-global "xm" 'smex)
			   (key-chord-define-global "gg" 'keyboard-quit)
			   (key-chord-define-global "gm" 'god-mode)
			   (key-chord-define-global "xb" 'helm-buffers-list)
			   (key-chord-define-global "3e" "\C-e")
			   (key-chord-define-global "[]" "[]\C-b")
			   (key-chord-define-global "<>" "<>\C-b")
			   (key-chord-define-global "''" "''\C-b")
			   (key-chord-define-global "\"\"" "\"\"\C-b")

			   (key-chord-define minibuffer-local-map "gg" 'abort-recursive-edit)

			   (key-chord-define emacs-lisp-mode-map "()" "()\C-b")

			   (key-chord-define dired-mode-map "qq" 'dired-up-directory)

			   (key-chord-define scala-mode-map "//"  "\C-e //")
			   (key-chord-define scala-mode-map "{}"  "{\n\n}\C-p\t")

			   (key-chord-define c++-mode-map ";;"  "\C-e;")
			   (key-chord-define c++-mode-map "//"  "\C-e //")
			   (key-chord-define c++-mode-map "{}"  "{\n\n}\C-p\t")

			   (key-chord-mode 1)))

(provide 'init-chords)
