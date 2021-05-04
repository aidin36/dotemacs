;;;
;;; Call this to swtich on Tabnine code completion
;;; Note: Make sure you installed Tabnine binary by calling
;;;     M-x company-tabnine-install-binary
;;; Not sure if we need to repeat it for upgrading the binary.
;;;
(defun my-tabnine ()
  "Turn on Tabnine autocomplete"
  (interactive)

  (use-package company
    :ensure t)

  (use-package company-tabnine
    :ensure t)

  ;; Don't wanna set it to zero. A little delay would be nice.
  (setq company-idle-delay 0.3)

  (global-company-mode 1)

  (message "Tabnine is ready!")
)
