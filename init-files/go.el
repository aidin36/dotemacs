(defun my-go()
  "Turn on all Go customizations"
  (interactive)

  ;; Required packages
  (use-package go-mode
    :ensure t
  )

  ;; TODO: Eldoc doesn't work. Look into alternatives.
  ;;(use-package go-eldoc
  ;;  :ensure t
  ;;)

  ;; Enabling eldoc (showing signatures on mini-buffer)
  ; (add-hook 'go-mode-hook 'go-eldoc-setup)

  ;; Formatting file before save.
  (add-hook 'before-save-hook #'gofmt-before-save)

  ;; Setting jump-to-definition shortkey
  ;; (global-set-key (kbd "M-.") 'godef-jump)

  (message "Ready to Go! Don't forget to run Eglot!")
)
