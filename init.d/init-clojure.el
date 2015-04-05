(req-package clojure-cheatsheet
  :require helm
  :commands clojure-cheatsheet)

(req-package clojure-mode
  :mode (("clj\\'" . clojure-mode)
		 ("cljs\\'" . clojure-mode)))

(req-package clojure-mode-extra-font-locking
  :require clojure-mode)

(req-package cider
  :require (clojure-mode eldoc)
  :commands cider-mode
  :init (progn (add-hook 'clojure-mode-hook #'cider-mode)
			   (add-hook 'cider-mode-hook #'eldoc-mode)
			   (setq nrepl-log-messages t)))

(req-package slamhound
  :commands slamhound)

(req-package clj-refactor
  :require clojure-mode
  :commands clj-refactor-mode
  :init (add-hook 'clojure-mode-hook #'clj-refactor-mode))

(req-package cljr-helm
  :require clojure-mode
  :commands cljr-helm
  :init (define-key clojure-mode-map (kbd "M-RET") 'cljr-helm))

(req-package 4clojure
  :commands (4clojure-check-answers 4clojure-open-question))

;; (req-package flycheck-clojure)
;; (req-package discover-clj-refactor)

(provide 'init-clojure)
