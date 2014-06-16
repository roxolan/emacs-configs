;; use igrep

(req-package igrep)

;; use wgrep

(req-package wgrep
  :require
  grep)

;; in-project search

(req-package fiplr
  :config (progn (setq fiplr-ignored-globs
                       (let* ((GLOBS fiplr-ignored-globs)
                              (ADDITIONAL-DIRS '(".zbuild" ".cask"))
                              (ADDITIONAL-FILES '("*.d" "*.elc" "*.dat" "*.raw" "*.wav" "*.class" "*.cache" "*.o"))
                              (CURRENT-DIRS (if GLOBS (cadar GLOBS) nil))
                              (CURRENT-FILES (if GLOBS (cadadr GLOBS) nil))
                              (NEW-DIRS (append CURRENT-DIRS ADDITIONAL-DIRS))
                              (NEW-FILES (append CURRENT-FILES ADDITIONAL-FILES)))
                         (list (cons 'directories (list NEW-DIRS))
                               (cons 'files (list NEW-FILES)))))
                 (global-set-key (kbd "C-x f") 'fiplr-find-file)
                 (global-set-key (kbd "C-x d") 'fiplr-find-directory)))

;; visual regexp

(req-package visual-regexp
  :require multiple-cursors
  :config (progn (define-key global-map (kbd "C-c r") 'vr/replace)
                 (define-key global-map (kbd "C-c q") 'vr/query-replace)
                 (define-key global-map (kbd "C-c m") 'vr/mc-mark)))

(provide 'init-search)
