;;;
;;; Call this to swtich on all Coffeescript development configs
;;;
(defun my-coffee ()
  "Turn on all Coffeescript configs"
  (interactive)

  (global-flycheck-mode)

  (use-package coffee-mode
    :ensure t)

  (custom-set-variables
   '(coffee-tab-width 2)
   '(flycheck-coffeelintrc "coffeelint.json"))

  ;; Adopted from this script: https://emacs.stackexchange.com/a/27609
  (defun use-coffee-from-node-modules ()
    (let ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 (lambda (dir)
                   (let ((coffee (expand-file-name "node_modules/.bin/coffee" dir)))
                    (and coffee (file-executable-p coffee)))))))
      (when root
        (let ((coffee (expand-file-name "node_modules/.bin/coffee" root)))
          (setq-local flycheck-coffee-executable coffee)))))
  (add-hook 'flycheck-mode-hook #'use-coffee-from-node-modules)

  (defun use-coffeelint-from-node-modules ()
    (let ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 (lambda (dir)
                   (let ((coffeelint (expand-file-name "node_modules/.bin/coffeelint" dir)))
                    (and coffeelint (file-executable-p coffeelint)))))))
      (when root
        (let ((coffeelint (expand-file-name "node_modules/.bin/coffeelint" root)))
          (setq-local flycheck-coffee-coffeelint-executable coffeelint)))))
  (add-hook 'flycheck-mode-hook #'use-coffeelint-from-node-modules)

  (message "Your Coffee is ready!")
)
