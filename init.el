;; initailize all other files in order

(add-to-list 'load-path
	     (expand-file-name "lisp/" user-emacs-directory))

(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(require 'builtin-config)

(with-system darwin
  (require 'osx-config))

(require 'bootstrap-straight)
(require 'package-config)
