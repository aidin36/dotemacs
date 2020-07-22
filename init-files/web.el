;;;
;;; Call this to swtich on all web development configs
;;;
(defun my-web ()
  "Turn on all Python customizations"
  (interactive)

  (use-package flow-minor-mode
    :ensure t)
  (use-package flycheck-flow
    :ensure t)

  ;; Adding flow to the flycheck
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
    (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
    (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

  ;; Enabling fly-check which uses ESLint
  ;; ESLint needs to be installed globally.
  (global-flycheck-mode)

  ;; Formatter
  (use-package prettier
    :ensure t)
  (global-prettier-mode)
)
