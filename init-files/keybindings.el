;; Moving around
;;(global-set-key (kbd "M-n") 'next-line)
;;(global-set-key (kbd "M-N") 'forward-paragraph)
;;(global-set-key (kbd "M-u") 'previous-line)
;;(global-set-key (kbd "M-U") 'backward-paragraph)
;;(global-set-key (kbd "M-j") 'forward-char)
;;(global-set-key (kbd "M-J") 'forward-to-word)
;;(global-set-key (kbd "M-h") 'backward-char)
;;(global-set-key (kbd "M-H") 'backward-word)

;; Helm keybinding for moving around according to my bindings
;;(define-key helm-map (kbd "M-n") 'helm-next-line)
;;(define-key helm-map (kbd "M-u") 'helm-previous-line)

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

; Windows
; Note: Use C-3 or C-M-3 for numberic input
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "C-o") 'other-window)

(global-set-key (kbd "M-s") 'save-buffer)

;; Zoom in/out
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

; My funcs
(global-set-key (kbd "M-z") 'zcd)
