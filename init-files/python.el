;;;
;;; Call this to swtich on all Python configs.
;;;
(defun my-python ()
  "Turn on all Python customizations"
  (interactive)

  (use-package elpy
    :ensure t
  )

  (elpy-enable)
)
