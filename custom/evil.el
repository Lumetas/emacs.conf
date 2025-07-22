;; Настройка Evil-mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-fu)
  ;; Основные маппинги
  ;; -----------------

  ;; Переход между окнами (Alt + hjkl)
  (define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "M-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "M-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "M-l") 'evil-window-right)

  ;; Навигация по тексту (Ctrl + hl)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-backward-word-begin)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-forward-word-begin)
  (define-key evil-visual-state-map (kbd "C-h") 'evil-backward-word-begin)
  (define-key evil-visual-state-map (kbd "C-l") 'evil-forward-word-begin)

  ;; Переход в начало/конец строки
  (define-key evil-normal-state-map (kbd "M-C-h") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "M-C-l") 'evil-end-of-line)
  (define-key evil-visual-state-map (kbd "M-C-h") 'evil-first-non-blank)
  (define-key evil-visual-state-map (kbd "M-C-l") 'evil-end-of-line)

  ;; Прокрутка (J/K как Ctrl-d/Ctrl-u)
  (define-key evil-normal-state-map (kbd "J") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "K") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "J") 'evil-scroll-down)
  (define-key evil-visual-state-map (kbd "K") 'evil-scroll-up)

  (define-key evil-normal-state-map (kbd "g d") 'lsp-find-definition)
  (define-key evil-normal-state-map (kbd "g k") 'lsp-ui-doc-glance)


  ;; Переопределяем стандартное `d`
  (evil-define-operator my-evil-delete-with-blackhole (beg end type register yank-handler)
    "Delete text and send it to the blackhole register (_)."
    (interactive "<R><x><y>")
    (evil-delete beg end type ?_ yank-handler))
  (define-key evil-normal-state-map "d" 'my-evil-delete-with-blackhole)
  (define-key evil-visual-state-map "d" 'my-evil-delete-with-blackhole)

  ;; Очистка подсветки поиска
  (define-key evil-normal-state-map (kbd "<escape>") 'evil-ex-nohighlight)

  ;; Дерево файлов (аналог NvimTree)
  (define-key evil-normal-state-map (kbd "C-n") 'treemacs)
  (define-key evil-normal-state-map (kbd "C-b") 'treemacs-select-window)

  ;; Биндинги как в Vim Commentary
  (define-key evil-normal-state-map (kbd "g c c") 'comment-line) ; gcc
  (define-key evil-visual-state-map (kbd "g c") 'comment-dwim)  ; для визуального режима

  ;; Alt+F везде как Escape
  (define-key evil-insert-state-map (kbd "M-f") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "M-f") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "M-f") 'evil-ex-nohighlight)
  ;; Переключение между буферами (аналог gp)
  (define-key evil-normal-state-map (kbd "gp") 
	      (lambda ()
		(interactive)
		(let ((current-buf (current-buffer)))
		  (switch-to-buffer (other-buffer))
		  (when (buffer-live-p current-buf)
		    (kill-buffer current-buf)))))

  ;; Кастомные команды проектов
  (define-key evil-normal-state-map (kbd "<leader>lp") 'projectile-switch-project)
  (define-key evil-normal-state-map (kbd "<leader>lr") 'projectile-run-project)
  (define-key evil-normal-state-map (kbd "<leader>lb") 'projectile-compile-project)

  ;; Вставка относительного пути файла
  (define-key evil-insert-state-map (kbd "C-f") 
	      (lambda ()
		(interactive)
		(let ((file (completing-read "Find file: " (projectile-current-project-files))))
		  (insert (file-relative-name file)))))
  )
