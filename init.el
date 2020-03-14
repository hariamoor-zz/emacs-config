(menu-bar-mode -1)
(tool-bar-mode -1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq enable-recursive-minibuffers t)

(add-to-list 'load-path (concat user-emacs-directory
				(convert-standard-filename "lisp/")))

(require 'package-config)
