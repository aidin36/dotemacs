;;;
;;; Call this to swtich on all web development configs
;;;
(defun my-web ()
  "Turn on all Python customizations"
  (interactive)

  ;; Enabling fly-check which uses ESLint
  ;; ESLint needs to be installed globally.
  (global-flycheck-mode)

  ;; Formatter
  (use-package prettier
    :ensure t)
  (global-prettier-mode)
)
