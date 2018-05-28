;;
;; ENSIME configurations
;;

;; ensime package (Scala)
(use-package ensime
  :ensure t
  :pin melpa-stable)

;; Disabling ensime startup message
(setq
 ensime-startup-notification nil
)

;;;
;;; Scalafmt
;;;
(defun run-cli-scalafmt (pos)
  "Format current file using `scalafmt' command line interface, preserving position `POS'."
  (interactive "d")
  (save-buffer)
  (call-process "ng-nailgun" nil nil nil "scalafmt" "-c" "/home/aidin/workspace/core/.scalafmt.conf" "--non-interactive" buffer-file-name)
  (revert-buffer :ignore-auto :noconfirm)
  (goto-char pos)
)

;;;
;;; Call this to swtich on all Scala configs.
;;;
(defun my-scala ()
  "Turn on all Scala customizations"
  (interactive)

  ;; Summary of current file
  (use-package popup-imenu
    :ensure t
    :commands popup-imenu
    :bind ("M-i" . popup-imenu))
  
  (require 'column-marker)
  (lambda () (interactive) (column-marker-1 120))

  (global-set-key (kbd "<f12>") 'run-cli-scalafmt)
  (add-hook 'before-save-hook 'run-cli-scalafmt)

  (message "Ready to Scala!")
)
