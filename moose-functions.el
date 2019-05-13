;;; moose-functions.el --- Assortment of functions I find useful.  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Christopher David Ramos

;; Author: Christopher David Ramos <ramos@Jupiter.local>
;; Keywords: convenience

;;; Commentary:
;;; shout out to https://emacs.stackexchange.com/a/358

;;; Code:

(require 'popup)
(require 'selected)


;;(global-set-key (kbd "C-x p") 'proced)

;; Turn off the minor mode in the minibuffer
(defun moose/turn-off-moose-mode ()
  "Turn off moose-mode."
  (moose-mode -1))
(add-hook 'minibuffer-setup-hook #'moose/turn-off-moose-mode)


;; (defun moose/init-commands ()
;;   (progn
;;     (menu-bar-mode -1)
;;     (fset 'yes-or-no-p 'y-or-n-p)
;;     (save-place-mode 1)))

(defun use-region-p ()
  (and (region-active-p)
       (or use-empty-active-region
           (> (region-end) (region-beginning)))))

(defun dsedivec/called-via-key-binding (cmd)
  "Returns non-nil if `this-command-keys' is bound to CMD."
  (eq (key-binding (this-command-keys)) cmd))


(defun moose/popup-count-words-region (start end)
  "Get word count for positive length active region."
  (interactive "r")
  (cond ((and (use-region-p)
              (dsedivec/called-via-key-binding #'moose/popup-count-words-region))
         (progn (let ((print-escape-newlines t))
           (popup-tip (concat (number-to-string (count-words start end)) " words")))
                (message "huh")))
        ((dsedivec/called-via-key-binding #'moose/popup-count-words-region) (insert (this-command-keys)))))


(defun moose/popup-count-words-up-to-point ()
  (let ((print-escape-newlines t))
    (popup-tip (concat (number-to-string (count-words 1 (point))) " words"))))


(defun moose/indent-current-buffer ()
  (interactive)
  (indent-region (point-min) (point-max) nil))

(defun moose/test-compilation-buffer (buffer string)
  "Return messages of success."
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not (search-forward "warning" nil t)))
      (message "Compilation successful.")
    (message "FAIL!")))


(defun moose/compilation-mode-hook ()
  (progn
    (setq compilation-read-command nil)
    (global-set-key "\C-x\C-m" 'compile-make)))




(defvar moose-mode-map nil "Keymap for `moose-mode-mode'")

(progn
  (setq moose-mode-map (make-sparse-keymap))
  (define-key moose-mode-map (kbd "C-c TAB") 'moose/indent-current-buffer)
  (define-key moose-mode-map (kbd "C-x k") 'moose/kill-current-buffer)
  (define-key moose-mode-map (kbd "w") #'moose/popup-count-words-region)
  (define-key moose-mode-map (kbd "<f1>") 'cua-mode)
  )

;;;###autoload
(define-minor-mode moose-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-moose-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " moose-mode"
  :keymap moose-mode-map)

;;;###autoload
(define-globalized-minor-mode global-moose-mode moose-mode moose-mode)


;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((moose-mode . ,moose-mode-map)))


(provide 'moose-functions)
;;; moose-functions.el ends here
