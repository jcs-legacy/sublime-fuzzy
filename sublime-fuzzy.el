;;; sublime-fuzzy.el --- Fuzzy matching algorithm like Sublime Text's string search  -*- lexical-binding: t; -*-

;; Copyright (C) 2021-2024  Shen, Jen-Chieh
;; Created date 2021-10-15 01:03:01

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; URL: https://github.com/jcs-elpa/sublime-fuzzy
;; Version: 0.1.0
;; Package-Requires: ((emacs "25.1"))
;; Keywords: matching sublime fuzzy algorithm

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Fuzzy matching algorithm based on Sublime Text's string search.
;;

;;; Code:

(require 'cl-lib)

(defconst sublime-fuzzy--bin-dir
  (concat (file-name-directory load-file-name) "bin/")
  "Pre-built binaries directory path.")

(defconst sublime-fuzzy--dyn-name "sublime_fuzzy_dyn"
  "Dynamic module name.")

;;
;; (@* "Externals" )
;;

(declare-function sublime-fuzzy-dyn-score "sublime-fuzzy-dyn")

;;
;; (@* "Aliases" )
;;

(defalias 'sublime-fuzzy-score #'sublime-fuzzy-dyn-score)

;;
;; (@* "Bootstrap" )
;;

;;;###autoload
(defun sublime-fuzzy-load-dyn ()
  "Load dynamic module."
  (interactive)
  (unless (featurep 'sublime-fuzzy-dyn)
    (let* ((dyn-name (cl-case system-type
                       ((windows-nt ms-dos cygwin) (concat sublime-fuzzy--dyn-name ".dll"))
                       (`darwin (concat "lib" sublime-fuzzy--dyn-name ".dylib"))
                       (t (concat "lib" sublime-fuzzy--dyn-name ".so"))))
           (dyn-path (concat sublime-fuzzy--bin-dir dyn-name)))
      (module-load dyn-path)
      (message "[INFO] Successfully load dynamic module, `%s`" dyn-name))))

(provide 'sublime-fuzzy)
;;; sublime-fuzzy.el ends here
