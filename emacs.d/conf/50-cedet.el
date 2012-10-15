;; cedet

(semantic-load-enable-excessive-code-helpers)

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 1)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))

(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)

;; return tabbar
(global-semantic-stickyfunc-mode -1)

(require 'semantic-decorate-include)

;; gcc setup
(require 'semantic-gcc)

;; smart complitions
(require 'semantic-ia)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local python-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(require 'eassist)

(defun elemc/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "M-]") 'semantic-tag-folding-show-block)
  (local-set-key (kbd "M-[") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-M-]") 'semantic-tag-folding-show-all)
  (local-set-key (kbd "C-M-[") 'semantic-tag-folding-fold-all)
  (local-set-key (kbd "C-c C-f") 'semantic-ia-fast-jump)
  )

(defun elemc/c-cpp-cedet-hook ()
  (local-set-key [f4] 'eassist-switch-h-cpp)
  (local-set-key (kbd "C-c C-g") 'eassist-list-methods)
  )

(add-hook 'c-mode-common-hook 'elemc/cedet-hook)
(add-hook 'c++-mode-common-hook 'elemc/cedet-hook)
(add-hook 'c-mode-common-hook 'elemc/c-cpp-cedet-hook)
(add-hook 'c++-mode-common-hook 'elemc/c-cpp-cedet-hook)

(add-hook 'python-mode-common-hook 'elemc/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'elemc/cedet-hook)


;; ;; gnu global support
(when (cedet-gnu-global-version-check t)
  (require 'semanticdb-global)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

;;; ede customization
(require 'semantic-lex-spp)
(global-ede-mode t)
(ede-enable-generic-projects)

;; clang setup
(require 'semantic-clang)

;; compilation
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(setq elemc/cmake-debug-command "mkdir -p build; pushd build; cmake -DCMAKE_BUILD_TYPE=Debug .. ; popd")
(setq elemc/cmake-release-command "mkdir -p build; pushd build; cmake -DCMAKE_BUILD_TYPE=Release .. ; popd")
(setq elemc/compile-command "pushd build; make -j2 -k; popd")

(defun elemc/cmake-debug ()
  "save and call cmake"
  (interactive)
  (save-some-buffers t)
  (compile elemc/cmake-debug-command)
  (message "CMake debug")
  )

(defun elemc/cmake-release ()
  "save and call cmake"
  (interactive)
  (save-some-buffers t)
  (compile elemc/cmake-release-command)
  (message "CMake release")
  )

(defun elemc/compile ()
  "save and call make"
  (interactive)
  (save-some-buffers t)
  (compile elemc/compile-command)
  (message "Build project")
  )


(global-set-key [f7] 'elemc/cmake-debug)
(global-set-key [f8] 'elemc/cmake-release)
(global-set-key [f9] 'elemc/compile)
  
;; Qt headers
(setq qt4-base-dir "/usr/include")

;; Only for Mac OS X
(if (eq system-type 'darwin)
    (setq qt4-base-dir "/Users/alex/tools/qt/4.8.3/include"))

(semantic-add-system-include qt4-base-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-dist.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))

;; ctags
(if (eq system-type 'darwin)
    (setq semantic-ectag-program "/usr/local/bin/ctags"))

;; ctags
(when (cedet-ectag-version-check t)
  (require 'semanticdb-ectag)
  (semantic-load-enable-primary-exuberent-ctags-support))

(setq enable-local-variables :all)
