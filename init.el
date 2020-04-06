;; initailize all other files in order

(add-to-list 'load-path
	     (expand-file-name "lisp/" user-emacs-directory))

(require 'builtin-config)

(require 'bootstrap-straight)
(require 'package-config)
