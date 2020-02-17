(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(use-package doom-themes
  :config
  (load-theme 'doom-sourcerer t))

(defun xah-fly-keys-callback ()
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1))

(use-package xah-fly-keys
  :config
  (xah-fly-keys-callback))

(defun auto-complete-callback ()
  (global-auto-complete-mode t)
  (ac-config-default))

(use-package auto-complete
  :config
  (auto-complete-callback))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(defun magit-callback ()
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch))

(use-package magit
  :config
  (magit-callback))

(defun pdf-tools-callback ()
  (setq auto-revert-interval 0.5)
  (auto-revert-set-timer))

(use-package pdf-tools
  :config
  (pdf-tools-callback))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
