;;; moose-functions.el --- Assortment of functions I find useful.  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Christopher David Ramos

;; Author: Christopher David Ramos <ramos@Jupiter.local>
;; Keywords: convenience

;;; Commentary:


;;; Code:

(require 'popup)

;;; optional
;; (use-package selected
;;   :ensure t
;;   :commands selected-minor-mode)

;; (define-key selected-keymap (kbd "w") #'moose/popup-count-words-region)


 (defun moose/popup-count-words-region (&optional start end)
   (interactive "r")
   (let ((print-escape-newlines t))
     (popup-tip (concat (number-to-string (count-words start end)) " words"))))


(defun moose/popup-count-words-up-to-point ()
  (let ((print-escape-newlines t))
     (popup-tip (concat (number-to-string (count-words 1 (point))) " words"))))





(provide 'moose-functions)
;;; moose-functions.el ends here
