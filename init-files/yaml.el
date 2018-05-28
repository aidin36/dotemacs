(require 'highlight-indentation)

;; Activating `highlight-identation' for all YAML files.
(add-to-list 'auto-mode-alist
             '("\\.yaml\\'".(lambda ()
                              (highlight-indentation-current-column-mode))))
