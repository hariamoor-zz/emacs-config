(use-package async 
  :config
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
  (setq message-send-mail-function 'async-smtpmail-send-it))

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark))

(use-package auctex
  :hook
  (TeX-after-compilation-finished . TeX-revert-document-buffer))

(use-package bash-completion
  :config
  (bash-completion-setup))

(use-package blackout
  :straight (:host github :repo "raxod502/blackout"))

(use-package boon
  :config
  (require 'boon-qwerty)
  (require 'boon-tutorial)
  :bind
  ("M-SPC" . boon-set-command-state)
  :hook (after-init . boon-mode))

(use-package company
  :blackout
  :bind ("\t" . company-complete)
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0))

(use-package company-auctex
  :requires company
  :config
  (company-auctex-init))

(use-package company-shell
  :requires company
  :config
  (add-to-list 'company-backends 'company-shell))

(use-package ctrlf
  :blackout
  :straight (ctrlf :host github :repo "raxod502/ctrlf")
  :config
  (ctrlf-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice
	(lambda () (get-buffer "*dashboard*"))))

(use-package dired+
  :straight (:host github :repo "emacsmirror/dired-plus"))

(use-package eshell-prompt-extras
  :after esh-opt
  :config
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-dakrone))

(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch)))

(use-package org
  :config
  (require 'ox-md))

(use-package prescient
  :blackout
  :requires selectrum
  :straight (selectrum-prescient
	     :host github
             :repo "emacsmirror/prescient"
             :files ("selectrum-prescient.el")))

(use-package selectrum
  :blackout
  :straight (:host github :repo "emacsmirror/selectrum")
  :config
  (selectrum-mode 1))

(use-package smart-mode-line
  :requires smart-mode-line-atom-one-dark-theme
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
