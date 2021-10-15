;;; sublime-fuzzy.el --- Fuzzy matching algorithm based on Sublime Text's string search  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Shen, Jen-Chieh
;; Created date 2021-10-15 01:03:01

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Fuzzy matching algorithm based on Sublime Text's string search.
;; Keyword: sublime fuzzy algorithm
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; URL: https://github.com/jcs-elpa/sublime-fuzzy

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

(require 'sublime-fuzzy-dyn)

;;
;; (@* "Externals" )
;;

(declare-function sublime-fuzzy-dyn-score "sublime-fuzzy-dyn")

;;
;; (@* "Aliases" )
;;

(defalias 'sublime-fuzzy-score #'sublime-fuzzy-dyn-score)

(provide 'sublime-fuzzy)
;;; sublime-fuzzy.el ends here
