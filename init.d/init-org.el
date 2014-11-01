(req-package org
  :mode ("\\.org$" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)))

(req-package org-gcal :disabled t :require org)

(req-package org-jira :require org)

(req-package jira :require xml-rpc)

(provide 'init-org)
