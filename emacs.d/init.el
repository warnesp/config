;; .emacs.d/init.el


;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    dracula-theme                   ;; alternate theme
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    magit                           ;; Git support
    material-theme                  ;; Theme
    neotree                         ;; file tree
    org                             ;; up to date org mode
    org-bullets                     ;; utf-8 bullets for org mode
    slime                           ;; Lisp Mode
    which-key                       ;; display key hints
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)


;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
;;(load-theme 'material t)            ;; Load material theme
(load-theme 'dracula t)            ;; Load dracula theme
(global-linum-mode t)               ;; Enable line numbers globally

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Documents/notes/chores.org" "/home/pwarnes/Documents/notes/shopping.org" "/home/pwarnes/Documents/notes/todo.org" "/home/pwarnes/Documents/notes/work.org"))
 '(package-selected-packages '(material-theme better-defaults))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ===================================
;; Lisp Customization
;; ===================================
(setq inferior-lisp-program "sbcl")

;; ===================================
;; Python Customization
;; ===================================
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; ===================================
;; Which-key Customization
;; ===================================
(when (require 'which-key)
  (which-key-mode))

;; ===================================
;; neotree Customization
;; ===================================
(when (require 'neotree nil t)
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-smart-open t))

;; ===================================
;; org mode Customization
;; ===================================

(when (require 'org)
  ;; replace ... with arrow
  (setq org-ellipsis " ▼"
	org-hide-emphasis-markers t)
  ;; headings different sizes
  (dolist (face '((org-level-1 . 1.2)
		(org-level-2 . 1.1)
		(org-level-3 . 1.05)
		(org-level-4 . 1.0)
		(org-level-5 . 1.1)
		(org-level-6 . 1.1)
		(org-level-7 . 1.1)
		(org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Liberation Sans" :weight 'regular :height (cdr face)))
  )

;; Heading bullets
(when (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
:q

(require 'org-indent)

;; Fira Code

;; ===================================
;; set some defaults
;; ===================================

;; start with TODO list open if available
(let ((todo-file "~/Documents/notes/todo.org"))
    (when (file-exists-p todo-file)
      (find-file todo-file)))

;; User-Defined init.el ends here

