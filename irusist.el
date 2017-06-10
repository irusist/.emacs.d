
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(defun open-my-init-file ()
  (message "aaba")
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
