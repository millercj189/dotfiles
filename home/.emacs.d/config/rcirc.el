;;=========================================================
;; RcIRC Settings
;;=========================================================

(require 'tls)
(require 'rcirc)

(rcirc-track-minor-mode 1)
(setq fill-paragraph-function 'rcirc-fill-paragraph)

;; Turn on spell checking.
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (flyspell-mode 1)))


;; Theme
;;----------------------------------------------------------

;; Keep input line at bottom
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (set (make-local-variable 'scroll-conservatively) 8192)))

;; dynamically set fill-column at redisplay time
(defvar dim:dynamic-fill-column-margin 2)
(defun dim:dynamic-fill-column-window (window &optional margin)
  (with-current-buffer (window-buffer window)
    (when (eq major-mode 'rcirc-mode)
      (setq fill-column
	    (- (window-width window)
	       (or margin dim:dynamic-fill-column-margin))))))

(defun dim:dynamic-fill-column (frame)
  (walk-windows 'dim:dynamic-fill-column-window 'no-minibuf frame))

(eval-after-load 'rcirc
  '(add-to-list 'window-size-change-functions 'dim:dynamic-fill-column))


;; Settings
;;----------------------------------------------------------

;; Authenticate
(load "~/.config/emacs/bin/euth/euth-rcirc.el")

(call-interactively 'rcirc)
