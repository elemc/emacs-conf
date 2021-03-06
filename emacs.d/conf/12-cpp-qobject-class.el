(defun elemc-skel-qobject-cpp-class (name)
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
             "/* C++ class header (QObject)           */\n"
             "/* Author: Alexei Panov <me@elemc.name> */\n"
             "/* ------------------------------------ */\n"
             "/* Name: " name "\n"
             "   Description:\n"
             "*/\n"
             "#ifndef " header-include-string "\n"
             "#define " header-include-string "\n"
             "\n"
             "#include <QtCore/QObject>\n"
             "\n"
             "class " name " : public QObject\n"
             "{\n"
             "Q_OBJECT\n"
             "public:\n"
             "\t explicit " name "(QObject *parent = 0);\n"
             "\t~" name "();\n"
             "\n"
             "private:\n\n"
             "signals:\n\n"
             "public slots:\n\n"
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
             "/* C++ class source (QObject)           */\n"
             "/* Author: Alexei Panov <me@elemc.name> */\n"
             "/* ------------------------------------ */\n"
             "/* Name: " name "\n"
             "   Description:\n"
             "*/\n"
             "#include \"" header-file-name "\"\n\n"
             name "::" name " (QObject *parent)\ :\nQObject(parent)\n"
             "{\n"
             "}\n\n"
             name "::~" name " ()\n"
             "{\n"
             "}\n"
             ))
    (beginning-of-buffer)
    (while (and (not (eobp)) (forward-line))
      (indent-according-to-mode))
    (beginning-of-buffer)
    (search-forward "Description:")
    )
  )
