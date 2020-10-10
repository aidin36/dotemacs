;;;
;;; Call this to swtich on all TypeScript development configs
;;;
(defun my-ts ()
  "Turn on all Web customizations"
  (interactive)

  (global-flycheck-mode)

  (use-package company
    :ensure t)

  (use-package tide
    :ensure t
    :after (typescript-mode company flycheck)
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
)
