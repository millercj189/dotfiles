;; Fluid-width window
(setq
 lui-time-stamp-position 'right-margin
 lui-fill-type nil)

(add-hook 'lui-mode-hook 'my-lui-setup)
(defun my-lui-setup ()
  (setq
   fringes-outside-margins t
   right-margin-width 5
   word-wrap t
   wrap-prefix "    ")
  (setf (cdr (assoc 'continuation fringe-indicator-alist)) nil))

;; Timestamps in Margins
(setq
 lui-time-stamp-position 'right-margin
 lui-time-stamp-format "%H:%M")

(add-hook 'lui-mode-hook 'my-circe-set-margin)
(defun my-circe-set-margin ()
  (setq right-margin-width 5))

;; Hide inactive user JOIN/PART spam
(setq circe-reduce-lurker-spam t)

;; Show channel messages in their own respective channels
(defun my-circe-message-option-chanserv (nick user host command args)
  (when (and (string= "ChanServ" nick)
             (string-match "^\\[#.+?\\]" (cadr args)))
    '((dont-display . t))))
(add-hook 'circe-message-option-functions 'my-circe-message-option-chanserv)

(defun my-circe-chanserv-message-handler (nick user host command args)
  (when (and (string= "ChanServ" nick)
             (string-match "^\\[\\(#.+?\\)\\]" (cadr args)))
    (let* ((channel (match-string 1 (cadr args)))
           (buffer (circe-server-get-chat-buffer channel t)))
      (let ((circe-server-last-active-buffer buffer))
        (circe-display-NOTICE nick user host command args)))))
(circe-add-message-handler "NOTICE" 'my-circe-chanserv-message-handler)

;; Prevent duplicate channel joining
(defun circe-network-connected-p (network)
  "Return non-nil if there's any Circe server-buffer whose
`circe-server-netwok' is NETWORK."
  (catch 'return
    (dolist (buffer (circe-server-buffers))
      (with-current-buffer buffer
        (if (string= network circe-server-network)
            (throw 'return t))))))

(defun circe-maybe-connect (network)
  "Connect to NETWORK, but ask user for confirmation if it's
already been connected to."
  (interactive "sNetwork: ")
  (if (or (not (circe-network-connected-p network))
          (y-or-n-p (format "Already connected to %s, reconnect?" network)))
      (circe network)))
