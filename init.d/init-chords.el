;; key chord mode

;; in-project search

(defun find-upper-svn-root (from acc)
  (let* ((UPPER (expand-file-name (concat from "/..")))
		 (NEWACC (cond ((file-exists-p (concat from "/.svn")) from)
					   (t acc))))
	(if (equal from "/")
		NEWACC
	  (find-upper-svn-root UPPER NEWACC))))

(defun upper-svn-status ()
  (interactive)
  (svn-status (find-upper-svn-root default-directory default-directory)))

(req-package key-chord
  :config (progn (key-chord-define-global "qq" 'kill-this-buffer)
                 (key-chord-define-global "qw" 'kill-this-buffer)
                 (key-chord-define-global "xm" 'smex)
                 (key-chord-define-global "gg" 'keyboard-quit)
                 (key-chord-define-global "xs" 'save-buffer)
                 (key-chord-define-global "xc" 'save-buffers-kill-terminal)
                 (key-chord-define-global "xf" 'find-file-in-vcs-directory)
                 (key-chord-define-global "xd" 'find-directory-in-vcs-directory)
                 (key-chord-define-global "``" 'shell-pop)

                 (key-chord-define-global ";m" 'magit-status)
                 (key-chord-define-global ";p" 'paradox-list-packages)
                 (key-chord-define-global ";j" 'open-line)
                 (key-chord-define-global ";k" 'kill-line)
                 (key-chord-define-global ";s" 'upper-svn-status)
                 (key-chord-define-global ";r" 'isearch-forward-regexp)
                 (key-chord-define-global ";y" 'yank)
                 (key-chord-define-global ";f" 'ido-find-file)

                 (key-chord-define-global ";o" 'switch-window)
                 (key-chord-define-global ";1" 'zygospore-toggle-delete-other-windows)
                 (key-chord-define-global ";2" 'split-window-below)
                 (key-chord-define-global ";3" 'split-window-right)
                 (key-chord-define-global ";4" 'kill-buffer-and-window)

                 (key-chord-define-global "1e" "\C-a")
                 (key-chord-define-global "2e" "\C-a\t")
                 (key-chord-define-global "3e" "\C-e")
                 (key-chord-define-global "4e" "\C-e ")

                 (key-chord-define-global "[]" "[]\C-b")
                 (key-chord-define-global "<>" "<>\C-b")
                 (key-chord-define-global "''" "''\C-b")
                 (key-chord-define-global "\"\"" "\"\"\C-b")
                 (key-chord-define-global "()" "()\C-b")

                 (key-chord-define minibuffer-local-map "gg" 'abort-recursive-edit)

                 (key-chord-mode 1)))

(provide 'init-chords)
