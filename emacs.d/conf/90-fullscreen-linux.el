(if (eq system-type 'gnu/linux)
    (progn
      (defun fullscreen (&optional f)
        (interactive)
        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                               '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
      (global-set-key (kbd "C-M-f") 'fullscreen)))
