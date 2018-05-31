;;
;; ENSIME configurations
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

  ;; ensime package (Scala)
  (use-package ensime
    :ensure t
    :pin melpa-stable)

  ;; Disabling ensime startup message
  (setq
   ensime-startup-notification nil
   )

  ;; Summary of current file (M-i)
  (use-package popup-imenu
    :ensure t
    :commands popup-imenu
    :bind ("M-i" . popup-imenu))

  (require 'column-marker)
  (lambda () (interactive) (column-marker-1 120))

  ;; Formatting before saving the file.
  (add-hook 'before-save-hook 'run-cli-scalafmt)

  (message "Ready to Scala!")
)
