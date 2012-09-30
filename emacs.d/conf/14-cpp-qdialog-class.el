(defun elemc-skel-qdialog-cpp-class (name)
  (interactive "sclass name: ")
  (let* ((header-file-name (concat (downcase name) ".h"))
         (header-include-string (upcase (concat name "_H")))
         (def-file-name (concat (downcase name) ".cpp")))

    ;; header
    (set-buffer (get-buffer-create header-file-name))
    (set-visited-file-name header-file-name)
    (c++-mode)
    (turn-on-font-lock)
    (insert (concat
             "// -*- C++ -*-\n"
             "/* ------------------------------------ */\n"
             "/* C++ class header (QDialog)           */\n"
             "/* Author: Alexei Panov <me@elemc.name> */\n"
             "/* ------------------------------------ */\n"
             "/* Name: " name "\n"
             "   Description:\n"
             "*/\n"
             "#ifndef " header-include-string "\n"
             "#define " header-include-string "\n"
             "\n"
             "#include <QtGui/QDialog>\n"
             "\n"
             "namespace Ui {\n"
             "class ChangePassword;\n"
             "}\n\n"
             "class " name " : public QDialog\n"
             "{\n"
             "Q_OBJECT\n"
             "Q_DISABLE_COPY(" name ")\n\n"
             "public:\n"
             "\texplicit " name "(QWidget *parent = 0, Qt::WindowFlags f = 0);\n"
             "\tvirtual ~" name "();\n"
             "\n"
             "private:\n"
             "\tUi::" name " *ui;\n\n"
             "private slots:\n\n"
             "};\n\n"
             "#endif\n"))
    (beginning-of-buffer)
    (while (and (not (eobp)) (forward-line))
      (indent-according-to-mode))
    
    ;; source
	(set-buffer (get-buffer-create def-file-name))
	(set-visited-file-name def-file-name)
	(switch-to-buffer (current-buffer))
	(c++-mode)
	(turn-on-font-lock)
	(insert (concat
             "// -*- C++ -*-\n"
             "/* ------------------------------------ */\n"
             "/* C++ class source (QDialog)           */\n"
             "/* Author: Alexei Panov <me@elemc.name> */\n"
             "/* ------------------------------------ */\n"
             "/* Name: " name "\n"
             "   Description:\n"
             "*/\n"
             "#include \"" header-file-name "\"\n"
             "#include \"ui_" header-file-name "\"\n\n"
             name ":" name " (QWidget *parent, Qt::WindowFlags f) :\n QDialog(parent, f),\nui(new Ui::" name ")\n"
             "{\n"
             "\tui->setupUi(this);\n"
             "}\n"
             name ":~" name " ()\n"
             "{\n"
             "delete ui;\n"
             "}\n"
             ))
    (beginning-of-buffer)
    (while (and (not (eobp)) (forward-line))
      (indent-according-to-mode))
    (beginning-of-buffer)
    (search-forward "Description:")
    )
  )
