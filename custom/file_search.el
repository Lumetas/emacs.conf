(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :custom
  (vertico-cycle t)) ; Циклическая навигация

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package consult
  :ensure t
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("M-g o" . consult-outline)
         ("M-s f" . consult-find)       ; аналог :Telescope find_files
         ("M-s g" . consult-grep)))     ; аналог :Telescope live_grep
