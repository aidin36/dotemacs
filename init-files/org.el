(use-package org
  :ensure t
)

(setq org-refile-targets '(("~/Documents/Tasks/today.org" :level . 1)
                           ("~/Documents/Tasks/backlog.org" :level . 1)
                           ("~/Documents/Tasks/fix-it-friday.org" :level . 1)
                           ("~/Documents/Tasks/ideas.org" :level . 1)
                           ("~/Documents/Tasks/someday.org" :level . 1)))

(setq org-agenda-files '("~/Documents/Tasks"))
