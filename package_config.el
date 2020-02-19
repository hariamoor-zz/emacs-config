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
  (load-theme 'doom-sourcerer t))

(use-package xah-fly-keys
  :config
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice
	(lambda () (get-buffer "*dashboard*"))))

(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch)))

(use-package auctex
  :hook
  (TeX-after-compilation-finished-functions . TeX-revert-document-buffer))

(use-package company
  :bind ("\t" . company-complete)
  :hook (after-init . global-company-mode))

(use-package company-auctex
  :config
  (company-auctex-init))

(use-package smart-tabs-mode
  :config
  (setq indent-tabs-mode t))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-strict-mode 1))

(use-package eshell-prompt-extras
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
	  eshell-prompt-function 'epe-theme-lambda)))

(use-package bash-completion
  :config
  (bash-completion-setup))

(use-package pdf-tools
  :config
  (pdf-tools-install :noquery)
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :hook
  (pdf-view-mode . pdf-links-minor-mode))

(use-package company-shell
  :defer 3
  :config
  (add-to-list 'company-backends 'company-shell))
