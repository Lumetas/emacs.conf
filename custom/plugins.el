(use-package treemacs
  :ensure t
  :config
  (define-key treemacs-mode-map (kbd "C-c p a") 'treemacs-add-project)
  (define-key treemacs-mode-map (kbd "C-c p d") 'treemacs-remove-project-from-workspace)

  (define-key treemacs-mode-map (kbd "C-c f d") 'treemacs-delete)
  (define-key treemacs-mode-map (kbd "C-c f m") 'treemacs-move-file)
  (define-key treemacs-mode-map (kbd "C-c f r") 'treemacs-rename)

  (define-key treemacs-mode-map (kbd "C-c a f") 'treemacs-create-file)
  (define-key treemacs-mode-map (kbd "C-c a d") 'treemacs-create-dir))

(use-package undo-fu
  :ensure t
  :config
  (global-unset-key (kbd "C-z"))  ; Освобождаем C-z для undo
  (global-set-key (kbd "C-z") 'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

(use-package eat
  :ensure t
  :hook (after-init . (lambda () (eat-mode t))))
