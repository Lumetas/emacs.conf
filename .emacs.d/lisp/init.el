;; emacs custom startup buffer without using default buffer or dashboard
;; consists of a centered image at the top and bold, centered text under
;; inspired by witchmacs startup screen
;; append to bottom of init.el

(defconst fancy-splash-text "Some text goes here")
(defconst fancy-splash-image "<full image path goes here>")
;; If concise is non-nil, that would mean to display a concise version of the splash screen in another window.
;; But instead I disable the screen if concise is non-nil.
(defun fancy-startup-screen (&optional concise)
  (if (not concise)
	  (let ((splash-buffer (get-buffer-create "STARTUP")))
		(with-current-buffer splash-buffer
		  (let ((inhibit-read-only t))
			(erase-buffer)
			(setq default-directory command-line-default-directory)
			(make-local-variable 'startup-screen-inhibit-startup-screen)
			(fancy-splash-head)
			(setq offsetLen (/ (length fancy-splash-text) 2))
			(insert (propertize " " 'display
								`(space :align-to (- center offsetLen))))
			(insert (propertize fancy-splash-text 'face 'bold))
			)
		  (setq buffer-read-only t))
		(switch-to-buffer splash-buffer))))
