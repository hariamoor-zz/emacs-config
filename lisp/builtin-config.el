;; configurations of builtin emacs systems

(menu-bar-mode -1)
(tool-bar-mode -1)

(setenv "SHELL" "/bin/bash")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      custom-safe-themes t)

;; set shell to bash so that shell prompt doesn't matter
;; performance improvements mentioned in:
;; gnu.org/software/emacs/manual/html_node/tramp/Frequently-Asked-Questions.html
(with-eval-after-load 'tramp
  (setq tramp-default-method "ssh"
	tramp-default-remote-shell "/bin/bash"
        tramp-completion-reread-directory-timeout nil
        vc-handled-backends '(Git)
        tramp-verbose 3))

(global-set-key (kbd "C-x l") 'eshell)

(global-auto-revert-mode)

(provide 'builtin-config)
