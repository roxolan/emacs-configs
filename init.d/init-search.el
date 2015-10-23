(require 'req-package)

;; use igrep

(req-package igrep :commands igrep)

;; use wgrep

(req-package wgrep :commands wgrep)

;; in-project search

(defun find-upper-vcs-root (from acc)
  (let* ((UPPER (expand-file-name (concat from "/..")))
		 (NEWACC (cond ((file-exists-p (concat from "/.svn")) from)
					   ((file-exists-p (concat from "/.git")) from)
					   (t acc))))
	(if (equal from "/")
		NEWACC
	  (find-upper-vcs-root UPPER NEWACC))))

(defun find-file-in-vcs-directory ()
  (interactive)
  (with-temp-buffer
	(progn (setq default-directory (find-upper-vcs-root default-directory default-directory))
		   (fiplr-find-file))))

(defun find-directory-in-vcs-directory ()
  (interactive)
  (with-temp-buffer
	(progn (setq default-directory (find-upper-vcs-root default-directory default-directory))
		   (fiplr-find-directory))))

(req-package fiplr
  :require key-chord
  :config (progn (setq fiplr-ignored-globs
                       (let* ((GLOBS fiplr-ignored-globs)
                              (ADDITIONAL-DIRS '(".zbuild"
                                                 ".cljs_rhino_repl"
                                                 ".cask"
                                                 ".repl"
                                                 "target"
                                                 "out"
                                                 "compiled"))
                              (ADDITIONAL-FILES '("*.DS_Store" "*.d" "*.elc" "*.dat" "*.raw" "*.wav" "*.class" "*.cache" "*.o"))
                              (CURRENT-DIRS (if GLOBS (cadar GLOBS) nil))
                              (CURRENT-FILES (if GLOBS (cadadr GLOBS) nil))
                              (NEW-DIRS (append CURRENT-DIRS ADDITIONAL-DIRS))
                              (NEW-FILES (append CURRENT-FILES ADDITIONAL-FILES)))
                         (list (cons 'directories (list NEW-DIRS))
                               (cons 'files (list NEW-FILES))))))
  :bind (("C-x f" . find-file-in-vcs-directory)
         ("C-x d" . find-directory-in-vcs-directory))
  :init (progn (key-chord-define-global "xf" 'find-file-in-vcs-directory)
			   (key-chord-define-global "xd" 'find-directory-in-vcs-directory)))

;; visual regexp

(req-package visual-regexp
  :require multiple-cursors
  :config (progn (define-key global-map (kbd "C-c r") 'vr/replace)
                 (define-key global-map (kbd "C-c q") 'vr/query-replace)
                 (define-key global-map (kbd "C-c m") 'vr/mc-mark)))

;; ignored folders

(req-package grep
  :defer 7
  :config (progn
            (add-to-list 'grep-find-ignored-directories "auto")
            (add-to-list 'grep-find-ignored-directories "elpa")
            (add-to-list 'grep-find-ignored-directories ".git")
            (add-to-list 'grep-find-ignored-directories ".svn")
            (req-package-hooks-add-execute 'grep-mode (lambda () (toggle-truncate-lines 1)))))

(provide 'init-search)
