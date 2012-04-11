(if (eq system-type 'gnu/linux)
    (progn
      (global-set-key (kbd "M-c") 'clipboard-kill-ring-save)
      (global-set-key (kbd "M-x") 'clipboard-kill-region)
      (global-set-key (kbd "M-v") 'clipboard-yank)
      (global-set-key (kbd "M-s") 'save-buffer)))
;(if (eq system-type 'darwin)
;    (progn
;      (global-set-key (kbd "s-c") 'clipboard-kill-ring-save)
;      (global-set-key (kbd "s-x") 'clipboard-kill-region)
;      (global-set-key (kbd "s-v") 'clipboard-yank)
;      (global-set-key (kbd "s-s") 'save-buffer)))
