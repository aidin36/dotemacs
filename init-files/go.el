(use-package go-mode
  :ensure t
)

(use-package flycheck
  :ensure t
)

(defun my-go()
  "Turn on all Go customizations"
  (interactive)

  ;; Flycheck for checkings at run-time
  (global-flycheck-mode)

  (add-hook 'before-save-hook 'gofmt-before-save)

  (message "Ready to Go!")
)
