(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq c-brace-imaginary-offset 0)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 4)
  (setq c-label-offset -4)
  (setq c-continued-statement-offset 4)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))

(setq auto-mode-alist (cons '(".*\\.[ch]$" . linux-c-mode)
                       auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.cpp$" . linux-c-mode)
                       auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.xs$" . c-mode)
                       auto-mode-alist))

(add-to-list 'load-path (expand-file-name "~/.emacs.modes"))
(load-library "cython-mode")

(require 'color-theme)
(load-library "color-theme-solarized")

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized-dark)))

;;; Uncomment for consolas font
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "microsoft" :family "Consolas")))))

(add-to-list 'load-path
             "~/.emacs.modes/plugins")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.modes/plugins/snippets")

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(add-to-list 'load-path "~/.emacs.modes/scala")
(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)))

(load-library "javascript")
(add-to-list 'auto-mode-alist '("\.js$" . javascript-mode))
(setq javascript-indent-level 2)


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))
