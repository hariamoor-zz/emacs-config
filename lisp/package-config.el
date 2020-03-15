;; straight.el bootstrap code

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; END bootstrap code

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package async
  :straight (emacs-async :host github
			 :repo "jwiegley/emacs-async")
  :config
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1)
  (async-bytecomp-package-mode '(all)))

(use-package diminish)

(use-package dired+
  :straight (dired+ :host github
		    :repo "emacsmirror/dired-plus"))

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark))

(use-package smart-mode-line
  :config
  (setq sml/theme 'atom-one-dark)
  :ensure smart-mode-line-atom-one-dark-theme
  :hook
  (after-init . sml/setup))

(use-package smartparens
  :diminish smartparens-global-mode smartparens-mode
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(use-package boon
  :config
  (require 'boon-qwerty)
  (require 'boon-tutorial)
  :bind
  ("M-SPC" . boon-set-command-state)
  :hook (after-init . boon-mode))

(use-package yasnippet
  :diminish yas-minor-mode
  :hook
  (after-init . yas-global-mode))

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
  :straight (auctex :host github
		    :repo "jwiegley/auctex")
  :hook
  (TeX-after-compilation-finished . TeX-revert-document-buffer))

(use-package company
  :diminish company-mode
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
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-dakrone))

(use-package bash-completion
  :config
  (bash-completion-setup))

(use-package counsel
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

(use-package ace-window
  :config
  (setq aw-dispatch-always t)
  :bind
  ("C-x o" . ace-window))

(provide 'package-config)
