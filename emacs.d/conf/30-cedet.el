(global-ede-mode 1)
(semantic-mode 1)
;; (semantic-add-system-include "/usr/include/Qt" 'c++-mode)
(setq qt4-base-dir "/usr/include/Qt")
(semantic-add-system-include qt4-base-dir 'c++-mode)
(semantic-add-system-include "/usr/include/QtCore" 'c++-mode)
(semantic-add-system-include "/usr/include/QtDBus" 'c++-mode)
(semantic-add-system-include "/usr/include/QtDeclarative" 'c++-mode)
(semantic-add-system-include "/usr/include/QtGui" 'c++-mode)
(semantic-add-system-include "/usr/include/QtHelp" 'c++-mode)
(semantic-add-system-include "/usr/include/QtMultimedia" 'c++-mode)
(semantic-add-system-include "/usr/include/QtNetwork" 'c++-mode)
(semantic-add-system-include "/usr/include/QtOpenGL" 'c++-mode)
(semantic-add-system-include "/usr/include/QtScript" 'c++-mode)
(semantic-add-system-include "/usr/include/QtScriptTools" 'c++-mode)
(semantic-add-system-include "/usr/include/QtSql" 'c++-mode)
(semantic-add-system-include "/usr/include/QtSvg" 'c++-mode)
(semantic-add-system-include "/usr/include/QtTest" 'c++-mode)
(semantic-add-system-include "/usr/include/QtUiTools" 'c++-mode)
(semantic-add-system-include "/usr/include/QtXml" 'c++-mode)
(semantic-add-system-include "/usr/include/QtXmlPatterns" 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))