;; BOILERPLATE - NEED TO FIGURE OUT HOW TO REMOVE

(package-initialize)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; END BOILERPLATE

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(use-package quelpa-use-package
  :config
  (setq use-package-ensure-function 'quelpa))

(use-package dired+
  :quelpa (dired+ :fetcher github :repo "emacsmirror/dired-plus"))

(use-package doom-themes
  :config
  (load-theme 'doom-sourcerer t))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

(use-package boon
  :config
  (require 'boon-qwerty)
  (require 'boon-tutorial)
  (boon-mode)
  :bind
  ("M-SPC" . boon-set-command-state))

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
  (TeX-after-compilation-finished-hook . TeX-revert-document-buffer))

(use-package company
  :bind ("\t" . company-complete)
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0))

(use-package company-auctex
  :requires company
  :config
  (company-auctex-init))

(use-package smart-tabs-mode
  :config
  (setq indent-tabs-mode t))

(use-package eshell-prompt-extras
  :after esh-opt
  :config
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-lambda))

(use-package bash-completion
  :config
  (bash-completion-setup))

(use-package pdf-tools
  :quelpa (pdf-tools :fetcher github :repo "politza/pdf-tools")
  :config
  (pdf-tools-install :no-query)
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :hook
  (pdf-view-mode . pdf-links-minor-mode))

(use-package company-shell
  :requires company
  :config
  (add-to-list 'company-backends 'company-shell))

(use-package org
  :bind
  (("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)))
