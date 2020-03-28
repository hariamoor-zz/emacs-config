;; configurations of builtin emacs systems

(menu-bar-mode -1)
(tool-bar-mode -1)

(setenv "SHELL" "/bin/bash")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      custom-safe-themes t)

;; changes applied from:
;; https://www.emacswiki.org/emacs/TrampMode
(with-eval-after-load 'tramp
  (setq tramp-default-method "ssh"
	tramp-default-remote-shell "/bin/bash"))

(with-eval-after-load 'eshell
  (global-set-key (kbd "C-x l") 'eshell))

(global-auto-revert-mode)

(provide 'builtin-config)
