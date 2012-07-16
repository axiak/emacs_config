;;; scss-mode.el --- Major mode for editing SCSS files
;;
;; Author: Anton Johansson <anton.johansson@gmail.com> - http://antonj.se
;; URL: https://github.com/antonj/scss-mode
;; Created: Sep 1 23:11:26 2010
;; Version: 0.5.0
;; Keywords: scss css mode
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.
;;
;;; Commentary:
;;
;; Command line utility sass is required, see http://sass-lang.com/
;; To install sass (haml):
;; gem install haml
;;
;; Also make sure sass location is in emacs PATH, example:
;; (setq exec-path (cons (expand-file-name "~/.gem/ruby/1.8/bin") exec-path))
;; or customize `scss-sass-command' to point to your sass executable.
;;
;;; Code:

(require 'derived)

(defgroup scss nil
  "Scss mode"
  :prefix "scss-"
  :group 'css)



(defconst scss-font-lock-keywords
  ;; Variables
  '(("$[a-z_-][a-z-_0-9]*" . font-lock-constant-face)))


;;;###autoload
(define-derived-mode scss-mode css-mode "SCSS"
  "Major mode for editing SCSS files, http://sass-lang.com/
Special commands:
\\{scss-mode-map}"
  (font-lock-add-keywords nil scss-font-lock-keywords)
  ;; Add the single-line comment syntax ('//', ends with newline)
  ;; as comment style 'b' (see "Syntax Flags" in elisp manual)
  (modify-syntax-entry ?/ ". 124" css-mode-syntax-table)
  (modify-syntax-entry ?* ". 23b" css-mode-syntax-table)
  (modify-syntax-entry ?\n ">" css-mode-syntax-table)
  (add-to-list 'compilation-error-regexp-alist scss-compile-error-regex)
  (add-hook 'after-save-hook 'scss-compile-maybe nil t))

(define-key scss-mode-map "\C-c\C-c" 'scss-compile)


;;;###autoload
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(provide 'scss-mode)
;;; scss-mode.el ends here
