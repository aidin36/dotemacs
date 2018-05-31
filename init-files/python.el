(use-package elpy
  :ensure t
)

;;;
;;; Call this to swtich on all Python configs.
;;;
(defun my-python ()
  "Turn on all Python customizations"
  (interactive)

  (elpy-enable)
)
