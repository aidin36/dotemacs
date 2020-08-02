;;;
;;; Call this to swtich on all web development configs
;;;
(defun my-web ()
  "Turn on all Web customizations"
  (interactive)

  ;; Enabling fly-check which uses ESLint
  ;; ESLint needs to be installed globally.
  (global-flycheck-mode)

  ;; Formatter
  (use-package prettier
    :ensure t)
  (global-prettier-mode)

  (use-package company
    :ensure t)
  (add-hook 'js-mode-hook 'company-mode)

  ;; Language Server
  ;; The 'lsp-diagnostic-package' disables the Flycheck integration.
  ;; I'm using ESLint because the LS Server doesn't get along well with 'flow'.
  (use-package lsp-mode
    :ensure t
    :hook ((js-mode . lsp))
    :commands lsp
    :custom (lsp-diagnostic-package :none))

  (use-package lsp-treemacs
    :ensure t)


  ;; Setting jump-to-definition shortkey
  ;; 'js-mode' assigns these keys, so we're replacing them.
  (add-hook 'js-mode-hook (lambda () (local-set-key (kbd "M-.") 'lsp-find-definition)))
  ;;(global-set-key (kbd "M-,") ;; It's already binded
  (global-set-key (kbd "M-?") 'lsp-find-references)

  ;; F8 is the neotree (file browsing)
  (global-set-key [f7] 'lsp-treemacs-symbols)

)
