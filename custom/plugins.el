(use-package treemacs
  :ensure t
  :config
  (define-key treemacs-mode-map (kbd "C-c p a") 'treemacs-add-project)
  (define-key treemacs-mode-map (kbd "C-c p d") 'treemacs-remove-project-from-workspace)

  (define-key treemacs-mode-map (kbd "C-c a f") 'treemacs-create-file)
  (define-key treemacs-mode-map (kbd "C-c a d") 'treemacs-create-dir))

(use-package undo-fu
  :ensure t
  :config
)

(use-package eat
  :ensure t
  :hook (after-init . (lambda () (eat-mode t))))
