(add-to-list 'load-path "/home/alex/.emacs.d/elisp/")
(require 'highlight-symbol)

(global-set-key (kbd "M-#") 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)