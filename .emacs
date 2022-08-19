;v-10
(setq show-paren-style 'expression)
(show-paren-mode 2)

(menu-bar-mode -1)
(tool-bar-mode -1)
(global-set-key (kbd "C-x C-c") 'kill-emacs)
(setq x-select-enable-clipboard t)

(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving



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
(global-unset-key (kbd "C-f"))

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




(speedbar-add-supported-extension "")
(setq speedbar-directory-unshown-regexp "^$")




(require 'linum-relative)
(linum-relative-on)
(global-set-key (kbd "C-к") 'isearch-backward)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-а") 'isearch-forward)
(global-unset-key (kbd "C-s"))

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
      scroll-conservatively  10000)
