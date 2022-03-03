(use-package org
  :ensure t
)

(setq org-refile-targets '(("~/Documents/Tasks/todo.org" :level . 1)
                           ("~/Documents/Tasks/someday.org" :level . 1)
                           ("~/Documents/Tasks/ideas.org" :level . 1)))

(setq org-agenda-files '("~/Documents/Tasks"))

(setq-default fill-column 100)

;; Enabling virtual indent mode
(add-hook 'org-mode-hook 'org-indent-mode)

;; It won't auto-reload if the buffer is modified. You won't lose un-saved work.
(add-hook 'org-mode-hook 'auto-revert-mode)

(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "MOVED" "WONTDO")))
