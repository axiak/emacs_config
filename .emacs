(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)

;; Disable vcs backends
(setq vc-handled-backends ())

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

(progn
   (require 'color-theme)
   (load-library "color-theme-solarized")
   (color-theme-initialize)
)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized-dark)))

(color-theme-initialize)
(color-theme-solarized-dark)

(setq show-trailing-whitespace t)

;;; Uncomment for ubuntu mono
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono")))))

(setq default-frame-alist '(
    (foreground-color . "#839496")
    (background-color . "#002b36")
))

; '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono")))))

;(setq default-frame-alist
;      '(
;        (foreground-color . "#839496")
;        (background-color . "#002b36")
;        )
;)

;(setq default-frame-alist '((font . "Inconsolata-dz-15")))


(add-to-list 'load-path
             "~/.emacs.modes/plugins")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.modes/plugins/snippets")

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
;;;;;;;;;;;;;;;;
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(require 'less-mode)

;;; Scala mode with yas
;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.modes/scala")
(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)))


;; Fun utility
;;;;;;;;;;;;;;
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

; OCTAVE + matlab
;;;;;;;;;;;;;;;;;
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
(cons '("\\.m$" . octave-mode) auto-mode-alist))

; Syntax checking for javascript
;;;;;;;;;;;


(load-library "less-mode")

;(load-library "javascript")
;(add-to-list 'auto-mode-alist '("\.js$" . javascript-mode))
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq javascript-indent-level 2)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


(require 'haml-mode)
(require 'yaml-mode)
(require 'slim-mode)
(require 'scss-mode)
(require 'sass-mode)


(defun save-and-reload () "Save and reload browser" (interactive)
    (save-buffer)
    (shell-command "chrome-reload")
  )
(define-key global-map "\C-x\C-r" 'save-and-reload)


(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))

