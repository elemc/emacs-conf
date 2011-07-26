;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(global-set-key (kbd "M-]") 'hs-toggle-hiding)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'python-mode-hook   'hs-minor-mode)
(add-hook 'sh-mode-hook       'hs-minor-mode)
(load-library "completion")

;;(load "/usr/share/doc/git-1.7.4.4/contrib/emacs/git.el")
;;(load "/usr/share/doc/git-1.7.4.4/contrib/emacs/git-blame.el")
(add-to-list 'vc-handled-backends 'GIT)

