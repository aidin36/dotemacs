(defun my-go()
  "Turn on all Go customizations"
  (interactive)

  ;; Required packages
  (use-package go-mode
    :ensure t
  )

  (use-package flycheck
    :ensure t
  )

  (use-package go-eldoc
    :ensure t
  )

  ;; Enabling eldoc (showing signatures on mini-buffer)
  (add-hook 'go-mode-hook 'go-eldoc-setup)

  ;; Flycheck for checkings at run-time
  (global-flycheck-mode)

  ;; Formatting file before save.
  (add-hook 'before-save-hook 'gofmt-before-save)

  ;; Setting jump-to-definition shortkey
  (global-set-key (kbd "M-.") 'godef-jump)

  (message "Ready to Go!")
)
