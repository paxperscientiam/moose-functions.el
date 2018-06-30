


   ;;;(shell-command-to-string (concat "bc <<<'" (number-to-string start) "+" (number-to-string end) "'"))
   ;;;(popup-tip (concat (shell-command-to-string (concat "wc -w < <(printf '%b' $'" (prin1-to-string (buffer-substring-no-properties start end)) "') | tr -d " (prin1-to-string "$'\n'"))) " words"))


 ;;;  (concat "wc -w" " < <(printf '%s' " (shell-quote-argument (buffer-substring-no-properties 3 10) ")")))))

You are dumb

 (call-interactively 'moose/popup-count-words-region)



 (defun indent-current-buffer ()
   (interactive)
   (indent-region (point-min) (point-max)))




(defun moose/insert-date ()
  "Insert the current date."
  (interactive "*")
  (insert (format-time-string "%b. %e, %Y")))



(defun shit ()
  "KDLSJF."
  (interactive)
  (count-words (point-min) (point-max)))

(defun lool (pos)
  "DFS"
  (interactive "d")
  (count-words (point) (point-max)))



(defun moose/indent-buffer ()
  "Indent entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-c TAB") 'indent-buffer)



(defun what-face (pos)
  "Return the font-lock face information at the current point
Thanks to Miles Bader <miles@lsi.nec.co.jp> for this (gnus.emacs.help)"
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face
        (message "Face: %s" face)
      (message "No face at %d" pos))))


(defun cort (start end)
  "Print number of words in the region."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (count-matches "\\sw+"))))


(defun clwr (start end)
  "Print number of lines words and characters in the region."
  (interactive "r")
  (message "Region has %d lines, %d words, %d characters"
           (count-lines start end)
           (count-words-region start end)
           (- end start)))


(setq popup (popup-create (point) 10 10))
(popup-set-list popup '("Foo" "Bar" "Baz"))
(popup-draw popup)
;; do something here
(popup-delete popup)



(set-text-properties

 load-file-name


;; (defun figlet-region (&optional b e)
;;   (interactive "r")
;;   (shell-command-on-region b e "figlet")
;;   (comment-region b e))
