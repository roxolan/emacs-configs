(defconst run-emacs-server-lock "~/.emacs.d/server.lock")
(defconst run-emacs-daemon-lock "~/.emacs.d/daemon.lock")

(defun run-emacs-run-client (args)
  (let* ((wrapped-args (mapcar (lambda (arg) (concat " \"" arg "\" ")) args))
         (args-str (if args (apply 'concat wrapped-args) "."))
         (command (concat "emacsclient " args-str)))
    (shell-command command)
    (delete-file "~/.emacs.d/daemon.lock" nil)))

(defun run-emacs-server-and-client ()
  (let ((HAS-INSTANCE (file-exists-p run-emacs-server-lock))
        (HAS-LOCK (file-exists-p run-emacs-daemon-lock)))
    (shell-command (concat "touch " run-emacs-daemon-lock))
    (if HAS-INSTANCE
        (run-emacs-run-client command-line-args-left)
      (if HAS-LOCK
          (progn (shell-command "emacs --daemon")
                 (run-emacs-run-client command-line-args-left))
        (progn (sleep-for 0 200)
               (run-emacs-server-and-client))))))

(run-emacs-server-and-client)
