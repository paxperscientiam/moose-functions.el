;;; package --- summary


;;; commentary:


;;; Code:
(use-package ov
  :pin melpa-stable)

(use-package fill-column-indicator)
(setq fci-rule-column 30)
(setq fci-rule-character '"^")
(setq fci-always-use-textual-rule t)
(setq fci-handle-truncate-lines nil)
(setq show-trailing-whitespace nil)

(ov-clear)


(defun moose/ss-draw-header()
  "Draw header."
  (setq ov-header (ov-line 0))
  (overlay-put ov-header 'before-string '"|  A  |  B  |  C  |")
  (ov-set ov-header 'face 'underline 'intangible t)
  )



(defun moose/ss-draw-rows ()
  "Blah blah blah."
  (linum-mode t)
  (set-face-attribute 'linum nil :foreground "blue" :weight 'light)
  (setq linum-format "%4d \u2502 ")
  )


(defun moose/ss-draw-columns ()
  "Draw column headers."
  (setq header-line-format "derp")
  (setq  header-line-format
         (list " " (make-string 79 ?-) "|"))
  )


(defun moose/ss-draw-canvas ()
  (ov (point-min) (point-max) '(face (:underline t)))

  )

(defun moose/ss-draw ()

  )




(provide 'csv-mode)
;;;
