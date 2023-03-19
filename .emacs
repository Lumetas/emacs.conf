(setq show-paren-style 'expression)
(show-paren-mode 2)
(xterm-mouse-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
(global-set-key (kbd "C-x C-c") 'kill-emacs)
(setq x-select-enable-clipboard t)

(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving
(defalias 'yes-or-no-p 'y-or-n-p)


(add-to-list 'load-path "~/.emacs.d/lisp")

;; http://code.google.com/p/dea/source/browse/trunk/my-lisps/linum%2B.el
(require 'linum+)
;(setq linum-format "%d   ")
(global-linum-mode 1)


;; built-in
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)





;; http://www.emacswiki.org/emacs/SrSpeedbar
(require 'sr-speedbar)
(global-set-key (kbd "C-n") 'sr-speedbar-toggle)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)



(global-set-key (kbd "M-h") 'backward-char)
(global-unset-key (kbd "C-b"))

(global-set-key (kbd "M-j") 'next-line)
;(global-unset-key (kbd "C-n"))

(global-set-key (kbd "M-k") 'previous-line)
(global-unset-key (kbd "C-p"))

(global-set-key (kbd "M-l") 'forward-char)

(global-set-key (kbd "M-р") 'backward-char)
(global-set-key (kbd "M-о") 'next-line)
(global-set-key (kbd "M-л") 'previous-line)
(global-set-key (kbd "M-д") 'forward-char)

(global-set-key (kbd "M-w") 'save-buffer)
(global-set-key (kbd "M-ц") 'save-buffer)
(global-set-key (kbd "C-k") 'kill-current-buffer)

(global-set-key (kbd "M-u") 'undo)
(global-set-key (kbd "M-г") 'undo)
(global-unset-key (kbd "C-x u"))

(global-set-key (kbd "C-M-h") 'move-beginning-of-line)
(global-set-key (kbd "C-M-l") 'move-end-of-line)

(global-set-key (kbd "M-y") 'kill-ring-save)
(global-set-key (kbd "M-н") 'kill-ring-save)
(global-set-key (kbd "M-d") 'kill-region)
(global-set-key (kbd "M-в") 'kill-region)
(global-set-key (kbd "M-p") 'yank)
(global-set-key (kbd "M-з") 'yank)
(put 'downcase-region 'disabled nil)


(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q k") 'describe-key)
(global-set-key (kbd "C-q f") 'describe-function)

(speedbar-add-supported-extension "")
(setq speedbar-directory-unshown-regexp "^$")




(require 'linum-relative)
(linum-relative-on)
(global-set-key (kbd "C-к") 'isearch-backward)

(global-set-key (kbd "<C-escape>") 'shell)

(require 'php-mode)
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/php"))

(custom-set-variables
 '(initial-scratch-message ""))
(custom-set-faces
 )
(setq-default tab-width          4)	
(define-key global-map (kbd "TAB") (kbd "C-u 4 SPC"))
(define-key global-map (kbd "<f5>") 'revert-buffer)
(setq scroll-step            1
      scroll-conservatively  1)
(global-set-key (kbd "C-h") 'left-word)
(global-set-key (kbd "C-l") 'right-word)
; Р‘СЂР°СѓР·РµСЂ
(setq
 browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
 shr-use-fonts  nil                          ; No special fonts
 shr-use-colors nil                          ; No colours
 shr-indentation 2                           ; Left-side margin
 shr-width 70                                ; Fold text to 70 columns
 eww-search-prefix "https://www.google.com/search?q=")    ; Use another engine for searching



(add-hook 'eww-mode-hook
		  (lambda ()
			(local-set-key (kbd "<f5>") 'eww-reload)
			(local-set-key (kbd "<M-left>") 'eww-back-url)
			(local-set-key (kbd "<M-right>") 'eww-forward-url)
			(local-set-key (kbd "C-h") 'eww-list-histories)
			(local-set-key (kbd "C-d") 'eww-add-bookmark)
			(local-set-key (kbd "C-o") 'eww-list-bookmarks)
            (linum-relative-toggle)
			))


										;(shell-command "cd ~/emacs.d/php/project && php -S localhost:8080 &")
										;(delete-window)

										;(defun ew-open-google ()
										;  (interactive)
										;(eww "localhost:8080")
										;)


(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
