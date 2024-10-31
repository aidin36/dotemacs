;;;
;;; Call this to swtich on all Javascript development configs
;;;
(defun my-js ()
  "Turn on all Javascript customizations"
  (interactive)

  ;; Formatter
  (use-package prettier
    :ensure t)
  (global-prettier-mode)

  (use-package company
    :ensure t)
  (add-hook 'js-mode-hook 'company-mode)

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
