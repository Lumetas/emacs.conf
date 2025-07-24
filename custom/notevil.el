(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "C-b"))
(global-set-key (kbd "C-v") 'treemacs)
(global-set-key (kbd "C-b") 'treemacs-select-window)

(global-unset-key (kbd "C-f"))
(global-unset-key (kbd "C-s"))

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'consult-line)

(global-unset-key (kbd "M-h"))
(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-l"))
(global-unset-key (kbd "C-M-h"))
(global-unset-key (kbd "C-M-l"))

(global-unset-key (kbd "C-e"))
(global-unset-key (kbd "C-a"))

(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "C-M-l") 'end-of-line)
(global-set-key (kbd "C-M-h") 'beginning-of-line)

(global-unset-key (kbd "C-z"))  ; Освобождаем C-z для undo
(global-set-key (kbd "C-z") 'undo-fu-only-undo)
(global-set-key (kbd "C-S-y") 'undo-fu-only-redo)
(setq-default cursor-type 'bar)
