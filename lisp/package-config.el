;; install and configure packages

(use-package async
  :config
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1))

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark))

(use-package auctex
  :hook
  (TeX-after-compilation-finished . TeX-revert-document-buffer))

(use-package blackout
  :straight (:host github :repo "raxod502/blackout"))

(use-package boon
  :bind
  ("M-SPC" . boon-set-command-state)
  :config
  (require 'boon-qwerty)
  (require 'boon-tutorial)
  :hook (after-init . boon-mode))

(use-package company
  :bind
  ("\t" . company-complete)
  :blackout
  :config
  (setq company-idle-delay 0)
  (global-company-mode 1))

(use-package company-auctex
  :config
  (company-auctex-init)
  :requires company)

(use-package company-shell
  :config
  (add-to-list 'company-backends
	       '(company-shell company-shell-env))
  :requires company)

(use-package ctrlf
  :blackout
  :config
  (ctrlf-mode)
  :straight (:host github :repo "raxod502/ctrlf"))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice
	(lambda () (get-buffer "*dashboard*"))))

(use-package dired+
  :straight (:host github :repo "emacsmirror/dired-plus"))

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

(use-package eshell-prompt-extras
  :after esh-opt
  :config
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-dakrone))

(use-package forge
  :after magit
  :bind
  ("C-x f" . forge-dispatch))

(use-package guess-style
  :config
  (global-guess-style-info-mode 1)
  :hook
  (prog-mode . guess-style-guess-all))

(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch)))

(use-package org
  :config
  (require 'ox-md)
  (setq org-export-in-background t))

(use-package prescient
  :blackout
  :config
  (selectrum-prescient-mode 1)
  (prescient-persist-mode 1)
  :straight (selectrum-prescient
	     :host github
             :repo "emacsmirror/prescient"
             :files ("selectrum-prescient.el"))
  :requires selectrum)

(use-package rg
  :bind
  ("C-c s" . rg-menu)
  :config
  (rg-enable-menu)
  :if (executable-find "rg"))

(use-package selectrum
  :blackout
  :config
  (selectrum-mode 1))

(use-package smart-mode-line
  :after smart-mode-line-atom-one-dark-theme
  :config
  (setq sml/theme 'atom-one-dark)
  :hook
  (after-init . sml/setup))

(use-package smart-mode-line-atom-one-dark-theme)

(use-package smartparens
  :blackout
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(use-package smart-tabs-mode
  :config
  (setq indent-tabs-mode t))

(use-package yasnippet
  :blackout yas-minor-mode
  :hook
  (after-init . yas-global-mode))

(use-package yasnippet-snippets)

(provide 'package-config)
