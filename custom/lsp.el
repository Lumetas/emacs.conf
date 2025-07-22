;; LSP для PHP (Intelephense)
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook (php-mode . lsp)  ;; Автозапуск LSP в PHP-файлах
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Префикс для LSP-команд
  (setq lsp-intelephense-php-version "8.2"))  ;; Версия PHP

;; UI для LSP (документация, ошибки, GoToDefinition)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t)       ;; Документация при наведении
  (setq lsp-ui-sideline-enable t)  ;; Боковая панель с ошибками
  (setq lsp-ui-peek-enable t))     ;; Просмотр определений (gd)

;; Автодополнение (company-mode)
(use-package company
  :ensure t
  :hook (php-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1)
  (global-company-mode 1))  ;; Включить для всех буферов

;; Интеграция LSP с company (через CAPF)
(setq company-backends '(company-capf))  ;; Используем встроенный механизм

;; Подсветка синтаксиса PHP
(use-package php-mode
  :ensure t
  :mode "\\.php\\'")

;; Подсветка ошибок (flycheck)
(use-package flycheck
  :ensure t
  :hook (php-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enable)))
