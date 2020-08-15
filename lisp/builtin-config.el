;; configurations of builtin emacs systems

(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(setenv "SHELL" "/usr/bin/fish")

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      backup-directory-alist
      `((".*" . ,temporary-file-directory))
      custom-safe-themes t
      display-line-numbers-type
      'relative
      echo-keystrokes 0.1
      ring-bell-function 'ignore
      shell-file-name "/usr/bin/fish"
      explicit-shell-file-name "/usr/bin/fish")

;; set shell to bash so that shell prompt doesn't matter performance
;; improvements mentioned in:
;; gnu.org/software/emacs/manual/html_node/tramp/Frequently-Asked-Questions.html
(setq tramp-default-method "ssh"
      tramp-default-remote-shell "/bin/bash"
      tramp-completion-reread-directory-timeout nil
      vc-handled-backends '(Git)
      tramp-verbose 10)

(global-auto-revert-mode)
(global-display-line-numbers-mode)
(global-visual-line-mode)
(show-paren-mode)

(global-set-key (kbd "C-x t") 'shell)
(global-set-key (kbd "C-x l") 'eshell)

(provide 'builtin-config)
