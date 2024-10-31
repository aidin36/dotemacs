;;
;; Scala configurations
;;

;;;
;;; Scalafmt
;;;
(defun run-cli-scalafmt ()
  "Format current file using `scalafmt' command line interface, preserving position `POS'."
  (interactive)

  (call-process "scalafmt" nil nil nil "-c" "/home/aidin/workspace/bonc/.scalafmt.conf" "--non-interactive" buffer-file-name)
  (revert-buffer :ignore-auto :noconfirm)
)

;;;
;;; Call this to swtich on all Scala configs.
;;;
(defun my-scala ()
  "Turn on all Scala customizations"
  (interactive)

  (use-package scala-mode
    :ensure t
    :mode "\\.s\\(cala\\|bt\\)$"
  )

  (use-package company
    :ensure t
    :hook (scala-mode . company-mode)
  )

(use-package eglot
  :pin melpa-stable
  :config
  (add-to-list 'eglot-server-programs '(scala-mode . ("metals")))
  ;; (optional) Automatically start metals for Scala files.
  :hook (scala-mode . eglot-ensure))

  (require 'column-marker)
  (add-hook 'scala-mode-hook (lambda () (interactive) (column-marker-1 120)))

  ;; Formatting before saving the file.
  ;;(add-hook 'after-save-hook 'run-cli-scalafmt)

  ; (global-set-key (kbd "M-/") 'lsp-find-references)

  (message "Ready to Scala! Run: M-x eglot")
)
