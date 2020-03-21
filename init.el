;; initailize all other files in order

(add-to-list 'load-path (concat user-emacs-directory
				(convert-standard-filename "lisp/")))

(require 'builtin-config)

(require 'bootstrap-straight)
(require 'package-config)
