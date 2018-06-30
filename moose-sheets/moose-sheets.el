

;;; Code:
(require 's)
(require 'maxima)
(require 'ov)
(require 'linum)
(require 'hlinum)
(require 'font-lock)


(defvar moose-sheets-mode-hook nil
  "initial hook for moose-sheets-mode."
  )






;; (defvar omg (window-width))
;; (defconst www 8)
;; (defvar hc (/ omg www))

;; (defvar heads "")





;; (concat "%" (number-to-string (/ omg www)) "d")



(defcustom moose-sheets-default-face 'default
  "Default face in `moose-sheets-mode' buffers."
  :type 'face)

;; (ov-clear)
;; (setq ov1 (ov-regexp ";\\(.*\\);"))

;; (ov-set ov1 'face '(:background "color-252" :underline "black") )


(defun ms/index-length ()
  (setq-local line-count (count-lines 1 (point-max)))
  (length (number-to-string line-count)))


(defun ms/linum-format (change-beg change-end prev-len)
  "OOO."
  (setq-local line-format-string (concat "|" "%" (number-to-string (ms/index-length)) "d |"))
  (setq-local linum-format line-format-string)
  (set-face-attribute 'linum nil
                      :background "light gray"
                      :foreground "black"
                      :weight 'semi-bold
                      :underline 't
                      )
  (linum-on)
  (set-face-attribute 'linum-highlight-face nil
                      :background "gray"
                      :foreground "dark green"
                      :weight 'semi-bold
                      :underline 't)
  (hlinum-activate)
  )


(defun ms/generate-column-headers ()
  "This is a docstring."
  (defconst ms-header-char-width 8)
  (defvar ms-buffer-width 'window-width))



(defun ms/header-line-format (change-beg change-end prev-len)
  "OK."
  (setq-local zeroth-header-length (s-repeat (+ 1 (ms/index-length)) " "))
  (setq-local header-line-format (concat "|" zeroth-header-length "|     A|     B|"))
  (set-face-attribute 'header-line nil
                      :background "light gray"
                      :foreground "black"
                      :weight 'semi-bold
                      :underline 't
                      ))



;;;(defun ms/set-default-face ()



(add-to-list 'after-change-functions 'ms/header-line-format t)
(add-to-list 'after-change-functions 'ms/linum-format t)

;; (eval-after-load
;;     (setq header-line-format " ")
;;   (set-face-attribute 'header-line nil :background "orange"))

;;; syntax table
(defconst moose-sheets-syntax-table
  (let ((table (make-syntax-table)))
    ;; ' is a string delimiter
    (modify-syntax-entry ?\; "|" table)
    table))




;;;###autoload
(add-to-list 'auto-mode-alist '("\\.sheet\\'" . moose-sheets-mode))


(defun ms/maxima-send-line ()
  (maxima-send-line)
  )

(define-derived-mode moose-sheets-mode maxima-mode "moose sheets mode"
  "Major mode for editing maxima based spreadsheets."
  :syntax-table moose-sheets-syntax-table
  (setq-local inhibit-modification-hooks nil)
  (ms/linum-format)
  (ms/generate-column-headers)
  (ms/header-line-format)
  )




(provide 'moose-sheets)

;;; resources
;;; https://www.emacswiki.org/emacs/SampleMode
;;; https://www.emacswiki.org/emacs/EmacsLispIntro
;;; https://www.emacswiki.org/emacs/GenericMode
;;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Group-Definitions.html

;; 20:07 < bpalmer`> physikoi: (define-derived-mode do-things fundamental-mode "Doing" :group 'emacs (foo) (bar) (baz))
;; 20:07 < ryouma> viz. current tabs (or maybe i mean sc.)
;; 20:07 < physikoi> bpalmer`: oh, looking at the docs I see that term ryouma mentioned earlier, "forms"
;; 20:07 < bpalmer`> physikoi: that makes M-x do-things RET call (foo) (bar) and (baz)