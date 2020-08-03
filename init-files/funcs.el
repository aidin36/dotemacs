(defun copy-buffer-file-name (choice)
  "Copy the buffer-file-name to the kill-ring"
  (interactive "cCopy Buffer Name (F) Full, (D) Directory, (N) Name")
  (let ((new-kill-string)
        (name (if (eq major-mode 'dired-mode)
                  (dired-get-filename)
                (or (buffer-file-name) ""))))
    (cond ((eq choice ?f)
           (setq new-kill-string name))
          ((eq choice ?d)
           (setq new-kill-string (file-name-directory name)))
          ((eq choice ?n)
           (setq new-kill-string (file-name-nondirectory name)))
          (t (message "Quit")))
    (when new-kill-string
      (message "%s copied" new-kill-string)
      (kill-new new-kill-string))))

;; `f' is one of my own shell functions. If you're someone other than me, you can ignore this (:
(defun fcd (path-name)
  "CD to a directory using 'f' command"
  (interactive "sPath short name ")

  ;; Loading the current shell along with its `rc' files.
  (let ((shell-command-switch "-ic"))
    ;; Invoking f command. `substring' used to remove trailing EOF.
    ;; And all the mess for running the command is to discard 'stderr'. ZSH complains about ZLE, which I want to ignore.
    (setq actual-path
          (substring
           (with-output-to-string
             (with-current-buffer
               standard-output
              (process-file shell-file-name nil '(t nil)  nil shell-command-switch (format "f p %s" path-name))))
           0 -1))

    (cd actual-path)
    (message (format "current dir: %s" actual-path))
  )
)

(defun zcd (path-name)
  "CD to a directory using 'z' command"
  (interactive "sPath short name ")

  ;; Loading the current shell along with its `rc' files.
  (let ((shell-command-switch "-ic"))

    ;; Invoking `z' command. `substring' used to remove trailing EOF.
    ;; And all the mess for running the command is to discard 'stderr'. ZSH complains about ZLE, which I want to ignore.
    (setq actual-path
          (substring
           (with-output-to-string
             (with-current-buffer
               standard-output
              (process-file shell-file-name nil '(t nil)  nil shell-command-switch (format "z -e %s" path-name))))
           0 -1))

    (cd actual-path)
    (message (format "current dir: %s" actual-path))
  )
)
