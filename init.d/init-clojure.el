(require 'req-package)

(req-package clojure-cheatsheet
  :require (helm clojure-mode cider)
  :commands clojure-cheatsheet
  :init (progn (define-key clojure-mode-map (kbd "C-h j") 'clojure-cheatsheet)
               (define-key cider-repl-mode-map (kbd "C-h j") 'clojure-cheatsheet)))

(req-package clojure-mode
  :mode (("clj\\'" . clojure-mode)
		 ("cljs\\'" . clojure-mode)))

(req-package clojure-mode-extra-font-locking
  :require clojure-mode)

(req-package cider
  :require (clojure-mode eldoc)
  :commands cider-mode
  :init (progn (req-package-add-hook-execute 'clojure-mode #'cider-mode)
			   (req-package-add-hook-execute 'cider-mode #'eldoc-mode))
  :config (setq nrepl-log-messages t))

;; (req-package slamhound
;;   :require clojure-mode
;;   :commands slamhound)

(req-package cider-profile
  :require cider
  :commands cider-profile-mode
  :init (progn (req-package-add-hook-execute 'cider-mode 'cider-profile-mode)
               (req-package-add-hook-execute 'cider-repl-mode 'cider-profile-mode)))

(req-package clj-refactor
  :require cider
  :commands clj-refactor-mode
  :init (req-package-add-hook-execute 'cider-mode #'clj-refactor-mode))

(req-package cljr-helm
  :require clj-refactor
  :commands cljr-helm
  :init (define-key clojure-mode-map (kbd "M-RET") 'cljr-helm))

(req-package 4clojure
  :commands (4clojure-check-answers 4clojure-open-question))

(req-package typed-clojure-mode
  :require clojure-mode
  :commands typed-clojure-mode
  :init (req-package-add-hook-execute 'clojure-mode 'typed-clojure-mode))

(req-package flycheck-clojure
  :require (clojure-mode flycheck)
  :config (progn (req-package-add-hook-execute 'clojure-mode
                   (lambda ()
                     (add-to-list 'flycheck-disabled-checkers 'clojure-cider-typed)))
                 (flycheck-clojure-setup)))

(req-package discover-clj-refactor
  :require clj-refactor
  :commands clj-refactor-turn-on-discover
  :init (req-package-add-hook-execute 'clojure-mode 'clj-refactor-turn-on-discover))

(req-package clojure-snippets
  :require (clojure-mode yasnippet)
  :config (clojure-snippets-initialize))

(req-package align-cljlet
  :require clojure-mode)

(req-package cljsbuild-mode
  :commands cljsbuild-start)

(req-package sotclojure :disabled t)

(provide 'init-clojure)
