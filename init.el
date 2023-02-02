;; Aqui é onde vai ficar toda a minha configuração do emac

;; Remover boas vindas
(setq inhibit-startup-message t) 

;; Remover barra de ferramentas
(tool-bar-mode -1) 

;; Remover barra de menu
(menu-bar-mode -1) 

;; Remover barra de rolagem
(scroll-bar-mode -1) 

;; Quebras de linha
(global-visual-line-mode t) 

;; Thema provisorio
(load-theme 'dracula t) 

;; Numeros nas linhas
(global-linum-mode t) 

;; Escolhendo a font
(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)  

;;-------------------------------------------------------------------------

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
(setq package-check-signature nil) 
;; Pacotes
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-pyright lsp-ui gnu-elpa-keyring-update org-roam-ui emacsql-sqlite3 org-roam use-package phi-autopair neotree lsp-mode flex-autopair fira-code-mode evil dracula-theme auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Configurações do org-mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-agenda-start-with-log-mode t)  
(setq org-log-done 'time)
(setq org-log-into-drawer t
      org-deadline-warning-days 30)


(setq org-startup-indented t)

;;Abrir emacs em um buffer específico
(setq initial-buffer-choice "C:/Users/artuh/Dropbox")

;;Configurações do org-roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "C:/Users/artuh/Dropbox/org-roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

;;(setq org-agenda-files
;;      '("C:/Users/artuh/Dropbox/org-agenda/Tasks.org"
;;	"C:/Users/artuh/Dropbox/org-agenda/Birthdays.org"
;;        "C:/Users/artuh/Dropbox/org-agenda/Habits.org"))
;;(setq org-capture-templates
;;      '(("t" "Todo" entry (file+olp "c:/Users/artuh/Dropbox/org-agenda/Tasks.org" "Inbox")
;;	 "* TODO %?\n %i\n %a")))


;; Algumas configurações básicas do org-habit
(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60)

;; Teste GTD no Emacs
(setq org-agenda-files '("C:/Users/artuh/Dropbox/org-agenda/GTD/inbox.org"
                         "C:/Users/artuh/Dropbox/org-agenda/GTD/gtd.org"
			 "C:/Users/artuh/Dropbox/org-agenda/Birthdays.org"
			 "C:/Users/artuh/Dropbox/org-agenda/Habits.org"
                         "C:/Users/artuh/Dropbox/org-agenda/GTD/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "C:/Users/artuh/Dropbox/org-agenda/GTD/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "C:/Users/artuh/Dropbox/org-agenda/GTD/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("C:/Users/artuh/Dropbox/org-agenda/GTD/gtd.org" :maxlevel . 3)
                           ("C:/Users/artuh/Dropbox/org-agenda/GTD/someday.org" :level . 1)
                           ("C:/Users/artuh/Dropbox/org-agenda/GTD/tickler.org" :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq org-habit-show-habits-only-for-today t)

;; Setando umas paradas de LSP
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui :ensure t)

(use-package ido-vertical-mode
  :ensure t
  :init
  (require 'ido)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-case-fold nil
        ido-auto-merge-work-directories-length -1
        ido-create-new-buffer 'always
        ido-use-filename-at-point nil
        ido-max-prospects 10)

 (autoload 'python-mode "python-mode" "Python Mode." t)
 (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(use-package company-anaconda
  :ensure t
  :init (require 'rx)
  :after (company)
  :config
  (add-to-list 'company-backends 'company-anaconda)
  )
(use-package company-quickhelp
  ;; Quickhelp may incorrectly place tooltip towards end of buffer
  ;; See: https://github.com/expez/company-quickhelp/issues/72
  :ensure t
  :config
  (company-quickhelp-mode)
  )

(add-hook 'python-mode-hook 'jedi:setup)
(setq python-shell-interpreter "/home/rafatieppo/anaconda3/bin/python3")

(global-company-mode t)

(setq company-idle-delay 0)

(setq company-minimum-prefix-length 3)

(company-quickhelp-mode 1)

(setq company-quickhelp-delay 0)

(defun my/python-mode-hook ())

(add-to-list 'company-backends 'company-jedi)

(add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(require 'company)
(require 'cl-lib)
(require 'help-mode)
(require 'find-func)

(defgroup company-elisp nil
  "Completion backend for Emacs Lisp."
  :group 'company)
