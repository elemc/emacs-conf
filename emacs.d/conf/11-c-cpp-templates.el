(defun elemc-skel-cmake-qt-project (name)
  (interactive "sProject name: ")
  (let* ((qrc-file-name (concat (downcase name) ".qrc"))
         (header-string (upcase name))
         (rc-file-name (concat (downcase name) ".rc")))

    ;; CMakeLists.txt
    (set-buffer (get-buffer-create "CMakeLists.txt"))
    (set-visited-file-name "CMakeLists.txt")
    (cmake-mode)
    (turn-on-font-lock)
    (insert (concat
             "# -*- CMake -*-\n"
             "# ------------------------------------ #\n"
             "# CMake file                           #\n"
             "# Author: Alexei Panov <me@elemc.name> #\n"
             "# ------------------------------------ #\n"
             "# Project: " name "\n"
             "# Description:\n"
             "#\n\n"
             "cmake_minimum_required (VERSION 2.6)\n\n"

             "if (NOT CMAKE_INSTALL_PREFIX)\n"
             "\tset (CMAKE_INSTALL_PREFIX /usr/local)\n"
             "endif ()\n\n"
             "set (PROJECT_NAME " name ")\n"
             "set (PROJECT_VERSION 0.0.1)\n"
             "set (HEADERS)\n"
             "set (SOURCES main.cpp)\n"
             "set (FORMS)\n"
             "set (RESOURCES " qrc-file-name ")\n"
             "set (DOC_FILES README)\n\n"
             "set (QT_USE_QTXML FALSE)\n"
             "set (QT_USE_QTNETWORK FALSE)\n\n"
             "project (${PROJECT_NAME})\n\n"
             "configure_file (\n"
             "\t\"${PROJECT_SOURCE_DIR}/config.h.in\"\n"
             "\t\"${PROJECT_BINARY_DIR}/config.h\"\n"
             ")\n\n"
             "include_directories (${CMAKE_CURRENT_BINARY_DIR})\n"
             "if (WIN32)\n"
             "\tfind_package (Qt4 COMPONENTS QtMain QtCore QtGui REQUIRED)\n"
             "else (WIN32)\n"
             "\tfind_package (Qt4 COMPONENTS QtCore QtGui REQUIRED)\n"
             "endif (WIN32)\n\n"
             "include (${QT_USE_FILE})\n"
             "qt4_add_resources (QRC_SOURCES ${RESOURCES})\n"
             "qt4_wrap_cpp (MOC_SOURCES ${HEADERS})\n"
             "qt4_wrap_ui (UI_SOURCES ${FORMS})\n"
             "source_group (\"Header Files\" FILES ${HEADERS})\n"
             "source_group (\"Source Files\" FILES ${SOURCES})\n"
             "source_group (\"Forms Files\" FILES ${UI_SOURCES})\n"
             "source_group (\"Generated Files\" FILES ${MOC_SOURCES})\n"
             "source_group (\"Resource Files\" FILES ${QRC_SOURCES})\n\n"
             "# Compile RC-file, only for Windows\n"
             "if (WIN32)\n"
             "\tset (GUI_TYPE WIN32)\n"
             "\tset (RC_FILE ${PROJECT_SOURCE_DIR}/${PROJECT_NAME}.rc)\n"
             "\tADD_CUSTOM_COMMAND( OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.o\n"
             "\t\tCOMMAND windres.exe -I${CMAKE_CURRENT_SOURCE_DIR} -i${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.rc \n"
             "\t\t\t-o ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.o )\n"
             "endif (WIN32)\n\n"
             "add_executable (${PROJECT_NAME} ${GUI_TYPE} ${HEADERS} ${SOURCES} ${UI_SOURCES} ${MOC_SOURCES} ${QRC_SOURCES} ${RC_FILE})\n"
             "target_link_libraries (${PROJECT_NAME} ${QT_LIBRARIES})\n"
             "\n"
             "install (TARGETS ${PROJECT_NAME} DESTINATION bin)\n"))
    (beginning-of-buffer)
    (while (and (not (eobp)) (forward-line))
      (indent-according-to-mode))
    
    ;; config.h.in
	(set-buffer (get-buffer-create "config.h.in"))
	(set-visited-file-name "config.h.in")
	(switch-to-buffer (current-buffer))
	(c++-mode)
	(turn-on-font-lock)
	(insert (concat
             "// -*- C++ -*-\n"
             "/* ------------------------------------ */\n"
             "/* C++ common header for project        */\n"
             "/* Author: Alexei Panov <me@elemc.name> */\n"
             "/* ------------------------------------ */\n"
             "/* Project: " name "\n"
             "   Description:\n"
             "*/\n"
             "#ifndef " header-string "_CONFIG_H\n"
             "#define " header-string "_CONFIG_H\n"
             "\n"
             "#define APPNAME \"@PROJECT_NAME@\"\n"
             "#define " header-string "_VERSION \"@PROJECT_VERSION@\"\n"
             "\n"
             "#endif\n"
             ))
    (beginning-of-buffer)
    (while (and (not (eobp)) (forward-line))
      (indent-according-to-mode))

    ;; resource file
	(set-buffer (get-buffer-create qrc-file-name))
	(set-visited-file-name qrc-file-name)
	(switch-to-buffer (current-buffer))
	(c++-mode)
	(turn-on-font-lock)
	(insert (concat
             "<RCC>\n"
             "</RCC>\n"
             ))
    (beginning-of-buffer)
    (while (and (not (eobp)) (forward-line))
      (indent-according-to-mode))


    (beginning-of-buffer)
    (search-forward "Description:")
    )
  )
