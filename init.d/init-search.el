;; use igrep

(req-package igrep)

;; use wgrep

(req-package wgrep
  :require
  grep)

;; in-project search

(req-package fiplr
  :init (progn (setq fiplr-ignored-globs
                     (let* ((GLOBS fiplr-ignored-globs)
                            (ADDITIONAL-DIRS '(".zbuild"))
                            (ADDITIONAL-FILES '("*.d" "*.elc" "*.dat" "*.raw" "*.wav"))
                            (CURRENT-DIRS (if GLOBS (cadar GLOBS) nil))
                            (CURRENT-FILES (if GLOBS (cadadr GLOBS) nil))
                            (NEW-DIRS (append CURRENT-DIRS ADDITIONAL-DIRS))
                            (NEW-FILES (append CURRENT-FILES ADDITIONAL-FILES)))
                       (list (cons 'directories (list NEW-DIRS))
                             (cons 'files (list NEW-FILES)))))
               (global-set-key (kbd "C-x f") 'fiplr-find-file)
               (global-set-key (kbd "C-x d") 'fiplr-find-directory)))

(provide 'init-search)
