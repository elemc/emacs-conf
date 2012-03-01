(add-to-list 'load-path "~/.emacs.d/elisp")    ; This may not be appeared if you have already added.
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
