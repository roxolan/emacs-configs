(require 'req-package)

(req-package org
  :mode ("\\.org$" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-'" . org-cycle-agenda-files)
         ("C-c b" . org-iswitchb))
  :config (progn (setq org-default-notes-file (concat org-directory "/notes.org"))
                 (setq org-tags-column -90)
                 (setq org-capture-bookmark t)
                 (setq org-refile-use-outline-path 'file)
                 (setq org-startup-folded 'showeverything)
                 (setq org-log-done 'note)
                 (define-key org-mode-map (kbd "C-M-\\") 'org-indent-region)))

(req-package org-bullets
  :require org
  :commands org-bullets-mode
  :init (req-package-hooks-add-execute 'org-mode (lambda () (org-bullets-mode 1))))

(req-package org-cliplink :require org
  :bind ("C-M-y" . org-cliplink))

(req-package org-gcal :disabled t :require org)

(req-package org-jira :require org)

(req-package jira :commands jira-login)

(req-package org-trello
  :disabled t
  :require org
  :commands org-trello-mode
  :init (req-package-hooks-add-execute 'org-mode (lambda () (org-trello-mode 1))))

(provide 'init-org)
