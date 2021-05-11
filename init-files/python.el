;;;
;;; Call this to swtich on all Python configs.
;;;
(defun my-python ()
  "Turn on all Python customizations"
  (interactive)

  (use-package elpy
    :ensure t
    :config
      (remove-hook 'elpy-modules 'elpy-module-flymake)
  )

  ;; Auto-completion.
  (use-package jedi
    :ensure t
  )

  ;; Code formatting
  (use-package py-autopep8
    :ensure t
  )

  ;; Forcing everyone to use Python3
  (setq python-shell-interpreter "python3")
  (setq py-python-command "/usr/bin/python3")
  (setq jedi:environment-root "jedi")
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv
                '("--python" "/usr/bin/python3")))

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

  (use-package flycheck
    :ensure t
  )

  ;; Setting python binary for flycheck.
  (declare-function python-shell-calculate-exec-path "python3.8")

  ;; Enabling fly-check which uses Pylint
  (global-flycheck-mode)

  ;; I sometimes hit it accidentally.
  (defun my-elpy-mode-hook-fun ()
    (local-unset-key (kbd "C-<RET>")))

  (add-hook 'elpy-mode-hook #'my-elpy-mode-hook-fun)

)
