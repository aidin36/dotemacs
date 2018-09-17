(setq debug-on-error t)

;; Load path
(add-to-list 'load-path "~/.emacs.d/libraries")

;; Maximize the window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; global variables
(setq
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 show-paren-delay 0
 sentence-end-double-space nil
 ;; Case insensitive search.
 case-fold-search t
 ;; Don't show startup page.
 inhibit-startup-screen t)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                    ("org" . "https://orgmode.org/elpa/")
                    ("melpa" . "https://melpa.org/packages/")
                    ("melpa-stable" . "https://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;;;
;;; Themes
;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (terraform-mode find-file-in-project flycheck-rust racer rust-mode auto-complete php-mode dockerfile-mode py-autopep8 jedi go-eldoc elpy exec-path-from-shell solarized-theme multiple-cursors xclip flycheck go-mode magit highlight-parentheses popup-imenu helm ensime use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package solarized-theme
  :ensure t
)
(load-theme 'solarized-light t)

; Fonts
;(set-default-font "Iosevka Term Slab 11" nil t)
(set-default-font "Source Code Variable 10" nil t)

;;
;; Editing
;;
(electric-indent-mode 0)
;; Highligh Parentheses mode. The hook ensures that It goes well with show-paren-mode
;; Hook copied from here: https://www.emacswiki.org/emacs/HighlightParentheses
;(use-package highlight-parentheses
;  :ensure t
;)
;(add-hook 'highlight-parentheses-mode-hook
;          '(lambda ()
;             (setq autopair-handle-action-fns
;                   (append
;					(if autopair-handle-action-fns
;						autopair-handle-action-fns
;                     '(autopair-default-handle-action))
;					'((lambda (action pair pos-before)
;						(hl-paren-color-update)))))))
;; Internal mode of show pren.
(show-paren-mode 1)
;; Line numbers
(global-linum-mode t)

;; White space clean up before each save
(add-hook 'before-save-hook #'whitespace-cleanup)

;; Autocompletion
(use-package auto-complete
  :ensure t
)
; Turning it on at all times.
;(global-auto-complete-mode)

;;
;; Appearance
;;

;; Removing menus.
(menu-bar-mode 0)
;(toggle-frame-fullscreen)
(tool-bar-mode -1)

;;;
;;; Short Keys
;;;
(use-package helm
  :ensure t
)

;; Helm search commands
(global-set-key (kbd "M-x") 'helm-M-x)
;; Helm switch buffer
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-l") 'helm-mini)
;; Helm search files
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; Helm imenu
(global-set-key (kbd "M-i") 'helm-imenu)

; Moving between buffers
(global-set-key (kbd "C-;") 'previous-buffer)
(global-set-key (kbd "C-'") 'next-buffer)

; List kill ring
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)

;;
;; Other configs
;;

;; Copy to system clipboard
(use-package xclip
  :ensure t
)
(xclip-mode 1)

;;;
;;; Multi cursor
;;; I assigned "M-j" to the Multi cursor.
;;;
(use-package cl-lib
  :ensure t
)
(use-package multiple-cursors
  :ensure t
)
(require 'multiple-cursors)

; Keybindings for multi cursor
(global-set-key (kbd "M-j") 'mc/mark-next-like-this)

;;;
;;; Setting PATH (for GO for example)
;;;
(use-package exec-path-from-shell
  :ensure t
)

;; Loading PATH environment variable from the user's default shell.
(when window-system
  (exec-path-from-shell-initialize)
  ; Disabling warning message.
  (setq exec-path-from-shell-check-startup-files nil)
  ; Loading GOPATH too.
  (exec-path-from-shell-copy-env "GOPATH")
)

;;;
;;; Finding files more easily inside a project.
;;;
(use-package find-file-in-project
  :ensure t
)
; Use `fd' instead of `find'.
(setq ffip-use-rust-fd t)

(global-set-key (kbd "C-x M-l") 'find-file-in-project)

;;;
;;; Other Packages
;;;
(use-package org
  :ensure t
)

;;;
;;; Other config files.
;;;
(load "~/.emacs.d/init-files/funcs.el")
(load "~/.emacs.d/init-files/scala.el")
(load "~/.emacs.d/init-files/git.el")
(load "~/.emacs.d/init-files/go.el")
(load "~/.emacs.d/init-files/yaml.el")
(load "~/.emacs.d/init-files/python.el")
(load "~/.emacs.d/init-files/docker.el")
(load "~/.emacs.d/init-files/php.el")
(load "~/.emacs.d/init-files/rust.el")
(load "~/.emacs.d/init-files/terraform.el")
