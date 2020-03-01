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

(use-package quelpa-use-package)

(use-package dired+
  :quelpa
  (dired+ :fetcher url :url "https://www.emacswiki.org/emacs/download/dired+.el")
  :defer 1)

(use-package doom-themes
  :config
  (load-theme 'doom-sourcerer t))

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
  (TeX-after-compilation-finished-functions . TeX-revert-document-buffer))

(use-package company
  :bind ("\t" . company-complete)
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0))

(use-package company-auctex
  :after company
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
  :config
  (pdf-tools-install :noquery)
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :hook
  (pdf-view-mode . pdf-links-minor-mode))

(use-package company-shell
  :after company
  :config
  (add-to-list 'company-backends 'company-shell))
