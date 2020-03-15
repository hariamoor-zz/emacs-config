(menu-bar-mode -1)
(tool-bar-mode -1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      custom-safe-themes t
      enable-recursive-minibuffers t)

(add-to-list 'load-path (concat user-emacs-directory
				(convert-standard-filename "lisp/")))

(require 'bootstrap-straight)
(require 'package-config)
