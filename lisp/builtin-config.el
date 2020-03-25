;; configurations of builtin emacs systems

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      custom-safe-themes t)

;; needed to make tramp work, see:
;; emacs.stackexchange.com/questions/12487/when-should-i-use-with-eval-after-load-in-my-configuration-files
(with-eval-after-load 'tramp
  (setq tramp-shell-prompt-pattern
	"\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*"))

(global-auto-revert-mode)

(provide 'builtin-config)
