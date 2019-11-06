(use-package org
  :ensure t
)

(setq org-refile-targets '(("~/Documents/Tasks/today.org" :level . 1)
                           ("~/Documents/Tasks/backlog.org" :level . 1)
                           ("~/Documents/Tasks/fix-it-friday.org" :level . 1)
                           ("~/Documents/Tasks/ideas.org" :level . 1)
                           ("~/Documents/Tasks/someday.org" :level . 1)))

(setq org-agenda-files '("~/Documents/Tasks"))

(setq-default fill-column 100)

;; Enabling virtual indent mode
(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "MOVED" "WONTDO")))
