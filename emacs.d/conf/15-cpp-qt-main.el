(defun elemc-skel-qt-main-cpp (name)
  (interactive "sclass name: ")
  (let* ((header-file-name (concat (downcase name) ".h"))
         (main-file-name "main.cpp"))

    ;; main
    (set-buffer (get-buffer-create main-file-name))
    (set-visited-file-name main-file-name)
    (c++-mode)
    (turn-on-font-lock)
    (insert (concat
             "// -*- C++ -*-\n"
             "/* ------------------------------------ */\n"
             "/* C++ source main file                 */\n"
             "/* Author: Alexei Panov <me@elemc.name> */\n"
             "/* ------------------------------------ */\n"
             "/* Name: main.cpp\n"
             "   Description:\n"
             "*/\n"
             "#include <QtGui/QApplication>\n"
             "#include <QtCore/QTextCodec>\n\n"
             "#include \"" header-file-name "\"\n"
             "\n"
             "int main ( int argc, char **argv )\n"
             "{\n"
             "QApplication app( argc, argv );\n\n"
             "/* set utf-8 codec for tr */\n"
             "QTextCodec *utfCodec = QTextCodec::codecForName(\"UTF-8\");\n"
             "QTextCodec::setCodecForTr(utfCodec);\n"
             "\n"
             name " mainWindow;\n"
             "mainWindow.show();\n"
             "int result = app.exec();\n"
             "\n"
             "delete utfCodec;\n"
             "return result;\n"
             "}\n"))
    (beginning-of-buffer)
    (while (and (not (eobp)) (forward-line))
      (indent-according-to-mode))    
    (beginning-of-buffer)
    (search-forward "Description:")
    )
  )
