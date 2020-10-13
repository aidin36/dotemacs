;;;
;;; Call this to swtich on all TypeScript development configs
;;;
(defun my-ts ()
  "Turn on all Typescript customizations"
  (interactive)

  (global-flycheck-mode)

  (use-package company
    :ensure t)

  (use-package tide
    :ensure t
    :after (typescript-mode company)
    :hook ((typescript-mode . tide-setup)
           (typescript-mode . tide-hl-identifier-mode)))

  ;; Formatter
  (use-package prettier
    :ensure t)
  (global-prettier-mode)

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; Note that it can also be configured per project via tsfmt.json file.
  (setq tide-format-options '(:placeOpenBraceOnNewLineForFunctions nil))

  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

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

  (setq-default flycheck-disabled-checkers '(typescript-tide))
)
