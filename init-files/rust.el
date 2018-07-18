(defun my-rust()
  "Turn on all of my Rust customizations"
  (interactive)

  (use-package rust-mode
    :ensure t
  )

  (use-package racer
    :ensure t
  )

  (use-package flycheck-rust
    :ensure t
  )

  (setq racer-cmd "~/.cargo/bin/racer")
  (setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)

  ;; Enabling fly-check
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (global-flycheck-mode)

  ;; Formatting before saving the file.
  ;;(add-hook 'before-save-hook 'rust-format-buffer)
)
