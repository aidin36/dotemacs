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

  (use-package flycheck
    :ensure t
  )

  (global-flycheck-mode)

  (use-package lsp-mode
    :ensure t
    :hook  (scala-mode . lsp)
    :config (setq lsp-prefer-flymake nil)
            (setq lsp-enable-snippet nil)
            (setq lsp-enable-file-watchers nil)
            (setq lsp-lens-enable nil)
  )

  (use-package lsp-metals
    :ensure t
  )

  (use-package company
    :ensure t
    :hook (scala-mode . company-mode)
    :config
    (setq lsp-completion-provider :capf))

  ;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
  ;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
  ;;   to avoid odd behavior with snippets and indentation
  ;; NOTE: It set to nil above
  ;(use-package yasnippet
  ;  :ensure t
  ;)

  ;; It's not working for some reason
  ;(use-package lsp-treemacs
  ;  :ensure t
  ;  :config
  ;  (lsp-metals-treeview-enable t)
  ;  (setq lsp-metals-treeview-show-when-views-received t)
  ;)

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

  (message "Ready to Scala!")
)
