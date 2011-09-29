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

;; rpm-spec-mode settings
(setq-default rpm-spec-user-mail-address "elemc AT atisserv DOT ru")
(setq-default rpm-spec-user-full-name "Alexei Panov")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
