(menu-bar-mode -1)
(tool-bar-mode -1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq enable-recursive-minibuffers t)

(setq package-config-file (expand-file-name "package_config.el" user-emacs-directory))
(load package-config-file)
