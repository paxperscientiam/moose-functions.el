;;; moose-functions.el --- Assortment of functions I find useful.  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Christopher David Ramos

;; Author: Christopher David Ramos <ramos@Jupiter.local>
;; Keywords: convenience

;;; Commentary:


;;; Code:

(require 'popup)


 (defun moose/popup-count-words-region (&optional start end)
   (interactive "r")
   (let ((print-escape-newlines t))
     (popup-tip (concat (number-to-string (count-words start end)) " words"))))


(provide 'moose-functions)
;;; moose-functions.el ends here
