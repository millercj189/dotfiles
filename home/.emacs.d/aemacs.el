;; Settings
;;----------------------------------------------------------
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)


;; Alias'
;;----------------------------------------------------------
(defalias 'yes-or-no-p 'y-or-n-p)


(setq line-number-mode t)
(setq column-number-mode t)
(add-hook 'prog-mode-hook #'linum-mode)


(add-hook 'before-save-hook
	  'delete-trailing-whitespace)


(defadvice load-theme
    (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))


(setq backup-directory-alist
      `((".*" . "~/.emacs.d/cache")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/cache" t)))



;; Keybinds
;;----------------------------------------------------------
(global-set-key (kbd "C-x ]" ) `next-buffer)
(global-set-key (kbd "C-x [" ) `previous-buffer)

(global-set-key (kbd "C-x <up>"    ) `windmove-up)
(global-set-key (kbd "C-x <down>"  ) `windmove-down)
(global-set-key (kbd "C-x <left>"  ) `windmove-left)
(global-set-key (kbd "C-x <right>" ) `windmove-right)

(global-set-key (kbd "C-x -" ) `split-window-vertically)
(global-set-key (kbd "C-x =" ) `split-window-horizontally)



;; Packages
;;----------------------------------------------------------
(let* ((my-lisp-dir "~/.emacs.d/bin")
       (default-directory my-lisp-dir)
       (orig-load-path load-path))
  (setq load-path (cons my-lisp-dir nil))
  (normal-top-level-add-subdirs-to-load-path)
  (nconc load-path orig-load-path))

;(require 'circe)
;(load "~/.emacs.d/config/circe.el")
;(load "~/.emacs.d/config/euth/eu-circe.el")

(require 'multi-term)
(load "~/.emacs.d/config/multi-term.el")

;;(require emux)
;;(load "~/.emacs.d/cfg/emux.el")

(load "~/.emacs.d/config/smarttabs.el")
