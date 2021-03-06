;;;
;;; Call this to swtich on all Javascript development configs
;;;
(defun my-js ()
  "Turn on all Javascript customizations"
  (interactive)

  ;; Enabling fly-check which uses ESLint
  ;; ESLint needs to be installed globally.
  (global-flycheck-mode)

  ;; Formatter
  (use-package prettier
    :ensure t)
  (global-prettier-mode)

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

  (use-package flow-minor-mode
    :ensure t)
  (add-hook 'js-mode-hook 'flow-minor-mode)

  ;; TODO: Add flow for js, add TypeScript for ts

  (use-package company-flow
    :ensure t)
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-flow))

  (use-package company
    :ensure t)
  (add-hook 'js-mode-hook 'company-mode)

  ;; Setting jump-to-definition shortkey
  ;; 'js-mode' assigns these keys, so we're replacing them.
  (add-hook 'js-mode-hook (lambda () (local-set-key (kbd "M-.") 'flow-minor-jump-to-definition)))
  ;;(global-set-key (kbd "M-,") ;; It's already binded
  (global-set-key (kbd "M-/") 'lsp-find-references)

  ;; F8 is the neotree (file browsing)
  (global-set-key [f7] 'lsp-treemacs-symbols)

  ;; Copied from here: https://emacs.stackexchange.com/a/27609
  (defun use-eslint-from-node-modules ()
    (let ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 (lambda (dir)
                   (let ((eslint (expand-file-name "node_modules/.bin/eslint" dir)))
                    (and eslint (file-executable-p eslint)))))))
      (when root
        (let ((eslint (expand-file-name "node_modules/.bin/eslint" root)))
          (setq-local flycheck-javascript-eslint-executable eslint)))))
  (add-hook 'flycheck-mode-hook #'use-eslint-from-node-modules)

  (message "Ready to JS!")
)
