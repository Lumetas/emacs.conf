(defun my-fancy-startup-screen (&rest args)
  (clear-image-cache)
  (let* ((pwidth (window-pixel-width))
         (pheight (* pwidth 0.75))
         (file (expand-file-name "~/some-background.jpg"))
         (tfile "/tmp/emacs-splash.jpg")
         (color "white")
         (font "/usr/share/fonts/corefonts/times.ttf")
         (rt (/ pwidth 1000.0))
         (size1 (* 80.0 rt)) (size2 (* 16.0 rt)) (size3 (* 24.0 rt))
         (x1 (* 50 rt)) (y1 (- pheight (* 120 rt)))
         (x2 (* 50 rt)) (y2 (- pheight (* 60 rt)))
         (x3 (* 40 rt)) (y3 (* 40 rt))
         (qtxt (replace-regexp-in-string "\t" "    " (with-temp-buffer (call-process "fortune" nil t nil) (buffer-string))))
         (args
          (list file "-resize" (format "%dx%d" (- pwidth 1) (- pwidth 1))
                "-fill" color "-font" font
                "-pointsize" (format "%d" size1) "-annotate" (format "+%d+%d" x1 y1) "GNU Emacs"
                "-pointsize" (format "%d" size2) "-annotate" (format "+%d+%d" x2 y2) (emacs-version)
                "-pointsize" (format "%d" size3) "-annotate" (format "+%d+%d" x3 y3) qtxt
                tfile)))
    (apply 'call-process "convert" nil nil nil args)
    (let ((frame (fancy-splash-frame)))
      (save-selected-window
        (select-frame frame)
        (switch-to-buffer "*About GNU Emacs*")
        (setq buffer-undo-list t)
        (let ((inhibit-read-only t))
          (erase-buffer)
          (insert (propertize " " 'display (create-image tfile)) "\n\n")
          (set-buffer-modified-p nil)
          (goto-char (point-min))
          (force-mode-line-update))
        (use-local-map splash-screen-keymap)
        (setq buffer-read-only t)))))

;; fancy-about-screen 関数を乗っ取る
(advice-add 'fancy-about-screen :around 'my-fancy-startup-screen)

;; 乗っ取り解除用
;; (advice-remove 'fancy-about-screen 'my-fancy-startup-screen)