 (require 'cl)

(when (>= emacs-major-version 24)
  ;;(require 'package)
;;   (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

;; add whatever packages you want here
(defvar irusist/packages '(
			   company
			   monokai-theme
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   js2-mode
			   nodejs-repl
			   exec-path-from-shell
			   popwin
			   reveal-in-osx-finder

			   ) "Default packages")

(setq package-selected-packages irusist/packages)

(defun irusist/packages-installed-p ()
  (loop for pkg in irusist/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (irusist/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg irusist/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the executable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode)

;; (require 'smartparens-config)  autoload 的， 去掉
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
