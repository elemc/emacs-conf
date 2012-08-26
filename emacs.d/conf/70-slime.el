;; Set up the Common Lisp environment
;; (add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
(if (eq system-type 'gnu/linux)
    (progn

      (setq inferior-lisp-program "/usr/bin/sbcl")
      (require 'slime)
      (slime-setup)))
