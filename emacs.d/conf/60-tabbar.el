(require 'tabbar)

(if (eq system-type 'gnu/linux)
    (progn
      (tabbar-mode 1)
      (global-set-key (kbd "M-}") 'tabbar-forward-tab)
      (global-set-key (kbd "M-{") 'tabbar-backward-tab)

 ;; add a buffer modification state indicator in the tab label,
 ;; and place a space around the label to make it looks less crowd
      (defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
        (setq ad-return-value
              (if (and (buffer-modified-p (tabbar-tab-value tab))
                       (buffer-file-name (tabbar-tab-value tab)))
                  (concat " + " (concat ad-return-value " "))
                (concat " " (concat ad-return-value " ")))))

      ;; called each time the modification state of the buffer changed
      (defun ztl-modification-state-change ()
        (tabbar-set-template tabbar-current-tabset nil)
        (tabbar-display-update))
      ;; first-change-hook is called BEFORE the change is made
      (defun ztl-on-buffer-modification ()
        (set-buffer-modified-p t)
        (ztl-modification-state-change))
      (add-hook 'after-save-hook 'ztl-modification-state-change)
      ;; this doesn't work for revert, I don't know
      ;;(add-hook 'after-revert-hook 'ztl-modification-state-change)
      (add-hook 'first-change-hook 'ztl-on-buffer-modification)
 
      (setq tabbar-buffer-groups-function
            (lambda () 
              (list
               (cond
                ((find (aref (buffer-name (current-buffer)) 0) " *") "*")
                (t "All Buffers"))
               )))
))