;; install and configure packages

(use-package async
  :config
  (setq async-bytecomp-allowed-packages '(all))
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1))

(use-package auctex
  :hook
  (TeX-after-compilation-finished . TeX-revert-document-buffer))

(use-package blackout)

(use-package boon
  :bind
  ("M-SPC" . boon-set-command-state)
  :config
  (require 'boon-qwerty)
  (require 'boon-tutorial)
  (when (eq system-type 'darwin)
    (global-set-key (kbd "M-m") 'boon-set-command-state))
  :hook (after-init . boon-mode))

(use-package cargo
  :after rust-mode
  :blackout
  :hook
  (rust-mode . cargo-minor-mode)
  :init
  (setq exec-path
      (append exec-path
              '(substitute-in-file-name "$HOME/.cargo/bin"))))
  
(use-package company
  :bind
  ("\t" . company-complete)
  :blackout
  :config
  (setq company-idle-delay 0)
  (global-company-mode 1))

(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

(use-package company-auctex
  :config
  (company-auctex-init)
  :requires company)

(use-package ctrlf
  :blackout
  :config
  (ctrlf-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice
	(lambda () (get-buffer "*dashboard*"))))

(use-package dired+)

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

(use-package eshell-prompt-extras
  :after esh-opt
  :config
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-dakrone))

(use-package go-mode
  :config
  (setq gofmt-before-save t)
  :init
  (setenv "GOROOT" "/usr/local/go"))

(use-package guess-style
  :config
  (global-guess-style-info-mode 1)
  :hook
  (prog-mode . guess-style-guess-all))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard))

(use-package lsp-mode
  :after which-key
  :blackout
  :config
  (setq lsp-rust-server 'rust-analyzer)
  (require 'lsp-clients)
  :hook
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui)

(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x j" . magit-dispatch)))

(use-package org
  :config
  (require 'ox-md))

(use-package rg
  :config
  (rg-enable-default-bindings)
  :if (executable-find "rg"))

(use-package rust-mode
  :after lsp-mode
  :config
  (setq rust-always-locate-project-on-open t
        rust-format-on-save t)
  :hook
  (rust-mode . lsp))

(use-package selectrum-prescient
  :blackout
  :config
  (selectrum-prescient-mode 1)
  (prescient-persist-mode 1)
  :requires selectrum)

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

(use-package which-key)

(use-package yasnippet
  :blackout yas-minor-mode
  :hook
  (after-init . yas-global-mode))

(use-package yasnippet-snippets)

(provide 'package-config)
