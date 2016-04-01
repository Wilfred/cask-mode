;;; cask-mode.el --- major mode for editing Cask files  -*- lexical-binding: t; -*-

;; Copyright (C) 2016

;; Author: Wilfred Hughes <me@wilfred.me.uk>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A basic major mode for editing Cask files. Provides syntax
;; highlighting.

;;; Code:

(defvar cask-mode-font-lock-keywords
  `((,(regexp-opt '("source" "package-file" "depends-on") 'symbol)
     . font-lock-keyword-face))
  )

;;;###autoload
(define-derived-mode cask-mode prog-mode "Cask"
  (setq-local font-lock-defaults '(cask-mode-font-lock-keywords)))

(add-to-list 'auto-mode-alist
             '("Cask" . cask-mode))

(provide 'cask-mode)
;;; cask-mode.el ends here
