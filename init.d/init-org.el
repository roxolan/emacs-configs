(require 'req-package)

(req-package org
  :mode ("\\.org$" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-'" . org-cycle-agenda-files)
         ("C-c b" . org-iswitchb))
  :config (progn (setq org-default-notes-file (concat org-directory "/notes.org"))
                 (setq org-capture-bookmark t)
                 (setq org-refile-use-outline-path 'file)
                 (setq org-startup-folded 'showeverything)))

(req-package org-cliplink :require org
  :bind ("C-M-y" . org-cliplink))

(req-package org-gcal :disabled t :require org)

(req-package org-jira :require org)

(req-package jira :require xml-rpc)

(provide 'init-org)
