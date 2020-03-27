;; configurations of builtin emacs systems

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      custom-safe-themes t)

;; changes applied from:
;; https://www.emacswiki.org/emacs/TrampMode
(with-eval-after-load 'tramp
  (setenv "SHELL" "/bin/bash")
  (setq tramp-shell-prompt-pattern
	"\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*"
        tramp-default-method "ssh"))

(global-auto-revert-mode)

(provide 'builtin-config)
