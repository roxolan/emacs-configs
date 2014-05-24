;; single dired

(req-package dired-single
  :require
  (dired helm-swoop autorevert diff-hl)
  :init
  (progn (define-key dired-mode-map (kbd "f")
           'dired-single-buffer)

         (define-key dired-mode-map (kbd "<RET>")
           'dired-single-buffer)

         (define-key dired-mode-map (kbd "^")
           (function (lambda ()
                       (interactive)
                       (dired-single-buffer ".."))))

         (define-key dired-mode-map (kbd "M-i")
           'helm-swoop)

         (add-hook 'dired-mode-hook (lambda ()
                                      (auto-revert-mode 1)))

         (add-hook 'dired-mode-hook (lambda ()
                                      (diff-hl-dired-mode 1)))))

;; sunrise commander

(req-package sunrise-commander
  :require
  (dired dired-single))

;; dired rainbow

(req-package dired-rainbow
  :require
  dired)

;; dired open

(req-package dired-open
  :require
  dired)

;; lusty

(req-package lusty-explorer
  :init (progn (global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
               (define-key lusty-mode-map (kbd "C-p") 'lusty-highlight-previous-column)
               (define-key lusty-mode-map (kbd "C-n") 'lusty-highlight-next-column)
               (define-key lusty-mode-map (kbd "C-b") 'lusty-highlight-previous)
               (define-key lusty-mode-map (kbd "C-f") 'lusty-highlight-next)))

(provide 'init-dired)
