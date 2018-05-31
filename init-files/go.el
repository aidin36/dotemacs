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

  ;; Flycheck for checkings at run-time
  (global-flycheck-mode)

  ;; Formatting file before save.
  (add-hook 'before-save-hook 'gofmt-before-save)

  (message "Ready to Go!")
)
