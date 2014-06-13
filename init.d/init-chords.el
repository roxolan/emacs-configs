;; key chord mode

(req-package key-chord
  :require (dired cc-mode god-mode smex helm magit scala-mode2)
  :init (progn (key-chord-define-global "qq" 'kill-this-buffer)
			   (key-chord-define-global "qw" 'kill-this-buffer)
			   (key-chord-define-global "xm" 'smex)
			   (key-chord-define-global "gg" 'keyboard-quit)
			   (key-chord-define-global "gm" 'god-mode)
			   (key-chord-define-global "xb" 'helm-buffers-list)
			   (key-chord-define-global "xs" 'save-buffer)
			   (key-chord-define-global "xc" 'save-buffers-kill-emacs)

			   (key-chord-define-global ";m" 'magit-status)
			   (key-chord-define-global ";l" 'helm-bookmarks)
			   (key-chord-define-global ";p" 'paradox-list-packages)
			   (key-chord-define-global ";j" 'open-line)
			   (key-chord-define-global ";k" 'kill-line)
			   (key-chord-define-global ";s" 'isearch-forward)
			   (key-chord-define-global ";r" 'isearch-forward-regexp)

			   (key-chord-define-global ";o" 'switch-window)
			   (key-chord-define-global ";1" 'delete-other-windows)
			   (key-chord-define-global ";2" 'split-window-below)
			   (key-chord-define-global ";3" 'split-window-right)

			   (key-chord-define-global "1e" "\C-a\t")
			   (key-chord-define-global "2e" "\C-a")
			   (key-chord-define-global "3e" "\C-e")
			   (key-chord-define-global "4e" "\C-e ")

			   (key-chord-define-global "[]" "[]\C-b")
			   (key-chord-define-global "<>" "<>\C-b")
			   (key-chord-define-global "''" "''\C-b")
			   (key-chord-define-global "\"\"" "\"\"\C-b")
			   (key-chord-define-global "()" "()\C-b")

			   (key-chord-define minibuffer-local-map "gg" 'abort-recursive-edit)

			   (key-chord-define dired-mode-map "qq" 'dired-up-directory)

			   (key-chord-define scala-mode-map ";;"  "\C-e;")
			   (key-chord-define scala-mode-map "//"  "\C-e //")
			   (key-chord-define scala-mode-map "{}"  "{\n\n}\C-p\t")
			   (key-chord-define scala-mode-map "(}"  "() {\n\n}\C-p\t")

			   (key-chord-define c++-mode-map ";;"  "\C-e;")
			   (key-chord-define c++-mode-map "//"  "\C-e //")
			   (key-chord-define c++-mode-map "{}"  "{\n\n}\C-p\t")
			   (key-chord-define c++-mode-map "(}"  "() {\n\n}\C-p\t")

			   (key-chord-mode 1)))

(provide 'init-chords)
