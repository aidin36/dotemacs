(defun copy-buffer-file-name (choice)
  "Copy the buffer-file-name to the kill-ring"
  (interactive "cCopy Buffer Name (f) Full, (d) Directory, (n) Name")
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

;; Copied from here: https://emacs.stackexchange.com/questions/3499/how-to-wrap-given-text-around-region
(defun wrap-word-or-region (text-begin text-end)
  "Surround current word or region with given text."
  (interactive "sStart tag: \nsEnd tag: ")
  (let (pos1 pos2 bds)
    (if (and transient-mark-mode mark-active)
        (progn
          (goto-char (region-end))
          (insert text-end)
          (goto-char (region-beginning))
          (insert text-begin))
      (progn
        (setq bds (bounds-of-thing-at-point 'symbol))
        (goto-char (cdr bds))
        (insert text-end)
        (goto-char (car bds))
        (insert text-begin)))))

(defun wrap-in-some ()
  (interactive)
  (wrap-word-or-region "Some(" ")")
)

(defun xah-user-buffer-q ()
  "Return t if current buffer is a user buffer, else nil.
Typically, if buffer name starts with *, it's not considered a user buffer.
This function is used by buffer switching command and close buffer command, so that next buffer shown is a user buffer.
You can override this function to get your idea of “user buffer”.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
version 2016-06-18"
  (interactive)
  (if (string-equal "*" (substring (buffer-name) 0 1))
      nil
    (if (string-equal major-mode "dired-mode")
        nil
      t
      )))

(defun xah-next-user-buffer ()
  "Switch to the next user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(defun xah-previous-user-buffer ()
  "Switch to the previous user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))
