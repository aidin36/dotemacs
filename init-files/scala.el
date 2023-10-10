;;
;; Scala configurations
;;

;;;
;;; Scalafmt
;;;
(defun run-cli-scalafmt ()
  "Format current file using `scalafmt' command line interface, preserving position `POS'."
  (interactive)

  (call-process "ng-nailgun" nil nil nil "scalafmt" "-c" "/home/aidin/workspace/core/.scalafmt.conf" "--non-interactive" buffer-file-name)
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

  ;(use-package flycheck
  ;  :ensure t
  ;)

  ;(global-flycheck-mode)

  ;; eglot is built in
  ; (use-package eglot)

  ;(use-package company
  ;  :ensure t
  ;  :hook (scala-mode . company-mode)
  ;  :config
  ;  (setq lsp-completion-provider :capf))

  ;; Summary of current file (M-i)
  ;(use-package popup-imenu
  ;  :ensure t
  ;  :commands popup-imenu
  ;  :bind ("M-i" . popup-imenu)
  ;)

  ;(require 'column-marker)
  ;(lambda () (interactive) (column-marker-1 120))

  ;; Formatting before saving the file.
  ;;(add-hook 'after-save-hook 'run-cli-scalafmt)

  (global-set-key (kbd "M-/") 'lsp-find-references)

  ; (message "Ready to Scala!")
  (message "Run: M-x eglot")
)
