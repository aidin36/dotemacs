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
 tab-width 2
 c-basic-offset 2)

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                    ("org" . "https://orgmode.org/elpa/")
                    ("melpa" . "https://melpa.org/packages/")
                    ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;;;
;;; Themes
;;;
(use-package solarized-theme
  :ensure t
)
(load-theme 'solarized-light t)

; Fonts
(set-face-attribute 'default nil
                    :family "Source Code Variable"
                    :height 100)

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

;; Global line numbers mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

;; White space clean up before each save
(add-hook 'before-save-hook #'whitespace-cleanup)

;; tree-sitter (syntax highlights).
;; See ~/.emacs.d/tree-sitter-grammars/README.md too
(require 'treesit)

;; Use tree-sitter mode for these languages.
;; Found it in this guide: https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
;(setq major-mode-remap-alist
; '((yaml-mode . yaml-ts-mode)
;   (bash-mode . bash-ts-mode)
;   (js2-mode . js-ts-mode)
;   (typescript-mode . typescript-ts-mode)
;   (json-mode . json-ts-mode)
;   (css-mode . css-ts-mode)
;   (go-mode . go-ts-mode)
;   (dockerfile-mode . dockerfile-ts-mode)
;   (python-mode . python-ts-mode)))

;; Automate the tree-sitter installation and activation.
;; See: https://robbmann.io/posts/emacs-treesit-auto/
(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;;
;; Appearance
;;

;; Removing menus.
(menu-bar-mode 0)
;; (toggle-frame-fullscreen)
(tool-bar-mode -1)
;; Always split side-by-side
(setq split-height-threshold nil)

;;
;; Other configs
;;

; Install this one from Melpa instead of Melpa-stable
(use-package flycheck
 :ensure t
 :pin melpa
)

(use-package helm
  :ensure t
)

(global-set-key (kbd "C-c M-r") 'helm-resume)
(global-set-key (kbd "C-c n") 'helm-resume)

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
; To make 'find-file-in-project' use Helm
(helm-mode 1)
; Use `fd' instead of `find'.
(setq ffip-use-rust-fd t)

;;;
;;; ag (silver searcher) from project root.
;;;
(use-package helm-ag
  :ensure t
)

(global-set-key (kbd "M-r") 'helm-do-ag-project-root)

;;; Magit
(load "~/.emacs.d/init-files/git.el")
; Use full buffer instead of half-windowed buffer.
(setq magit-status-buffer-switch-function 'switch-to-buffer)

;;; Neotree
(use-package all-the-icons
  :ensure t
)

(use-package neotree
  :ensure t
)

; Use icons theme for Window and arrow (ascii) theme for Terminal.
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(global-set-key [f8] 'neotree-toggle)

(use-package puppet-mode
  :ensure t
)
(add-hook 'puppet-mode-hook 'highlight-indentation-current-column-mode)

;; Kubernetes
(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))

;;
;; Disabled commands
;;
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;;
;;; Other config files.
;;;
(load "~/.emacs.d/init-files/keybindings.el")
(load "~/.emacs.d/init-files/funcs.el")
(load "~/.emacs.d/init-files/scala.el")
(load "~/.emacs.d/init-files/go.el")
(load "~/.emacs.d/init-files/yaml.el")
(load "~/.emacs.d/init-files/python.el")
(load "~/.emacs.d/init-files/docker.el")
(load "~/.emacs.d/init-files/php.el")
(load "~/.emacs.d/init-files/rust.el")
(load "~/.emacs.d/init-files/terraform.el")
(load "~/.emacs.d/init-files/org.el")
(load "~/.emacs.d/init-files/js.el")
(load "~/.emacs.d/init-files/ts.el")
(load "~/.emacs.d/init-files/coffee.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-M-x-always-save-history t)
 '(package-selected-packages
   '(eglot prettier tide go-mode company scala-mode terraform-mode dockerfile-mode kubernetes puppet-mode neotree all-the-icons magit helm-ag find-file-in-project exec-path-from-shell multiple-cursors helm flycheck treesit-auto solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
