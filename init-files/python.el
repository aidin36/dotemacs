;;;
;;; Call this to swtich on all Python configs.
;;;
(defun my-python ()
  "Turn on all Python customizations"
  (interactive)

  (use-package elpy
    :ensure t
  )

  ;; Auto-completion.
  (use-package jedi
    :ensure t
  )

  ;; Code formatting
  (use-package py-autopep8
    :ensure t
  )

  (elpy-enable)

  ;; Enabling Jedi.
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (jedi:install-server)

  ;; Setting jump-to-definition shortkey
  (global-set-key (kbd "M-.") 'jedi:goto-definition)
  (global-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)

  ;; Enabling auto format on save.
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

  ;; Enabling fly-check which uses Pylint
  (global-flycheck-mode)
)
