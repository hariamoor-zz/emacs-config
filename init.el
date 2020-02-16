(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(use-package doom-themes
  :config
  (load-theme 'doom-acario-dark t))

(defun god-mode-callback ()
  (global-set-key (kbd "<escape>") 'god-local-mode)
  (define-key god-local-mode-map (kbd "i") 'god-local-mode)
  (define-key god-local-mode-map (kbd ".") 'repeat)
  (global-set-key (kbd "C-x C-1") 'delete-other-windows)
  (global-set-key (kbd "C-x C-2") 'split-window-below)
  (global-set-key (kbd "C-x C-3") 'split-window-right)
  (global-set-key (kbd "C-x C-0") 'delete-window))

(use-package god-mode
  :config
  (god-mode-callback))

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

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
