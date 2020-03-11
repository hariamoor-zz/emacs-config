; BOILERPLATE - NEED TO FIGURE OUT HOW TO REMOVE

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

(use-package async
  :config
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1))

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

(use-package counsel
  :init
  (setq enable-recursive-minibuffers t)
  :config
  (setq ivy-use-virtual-buffers t)
  :bind
  (("C-s" . swiper-isearch)
  ("C-c c" . counsel-compile)
  ("C-c g". counsel-git)
  ("C-c j" . counsel-git-grep)
  ("C-c L" . counsel-git-log)
  ("C-c k" . counsel-rg)
  ("C-c m" . counsel-linux-app)
  ("C-x l" . counsel-locate)
  ("C-c J" . counsel-file-jump))
  :hook (after-init . ivy-mode))

(use-package pdf-tools
  :ensure nil
  :hook
  (pdf-view-mode . pdf-links-minor-mode)
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query))

(use-package company-shell
  :requires company
  :config
  (add-to-list 'company-backends 'company-shell))

(use-package avy
  :config
  (avy-setup-default)
  :bind
  (("C-:". avy-goto-char)
  ("C-'" . avy-goto-char-2)
  ("M-g f" . avy-goto-line)
  ("M-g w" . avy-goto-word-1)
  ("M-g e" . avy-goto-word-0)
  ("C-c C-j" . avy-resume)))

(provide 'package-config)
