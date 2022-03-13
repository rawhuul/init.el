;; init.el

;; Code:

;; Installing straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-check-for-modifications nil)

(setq inhibit-startup-message t)
(setq fast-but-imprecise-scrolling t)
(setq visible-bell nil)
(setq frame-inhibit-implied-resize t)
(setq use-dialog-box nil)
(setq compilation-scroll-output 'first-error)
(setq default-frame-parameters '((inhibit-double-buffering . t)))
(setq ad-redefinition-action 'accept)
(setq create-locked nil)
(setq auto-revert-use-notify nil)
(setq split-width-threshold nil)
(setq electric-pair-preserve-balance nil)

(global-visual-line-mode +1)
(setq custom-file (concat user-emacs-directory "custom.el"))
(setq-default auto-save-default nil
	      create-lockfiles nil
	      make-backup-files nil
	      cursor-type 'bar
	      truncate-lines t
	      word-wrap t)

(straight-use-package 'no-littering)
(require 'no-littering)
(setq custom-file (no-littering-expand-etc-file-name "custom.el"))

(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" no-littering-etc-directory)
      recentf-max-saved-items 500
      recentf-max-menu-items 15
      recentf-auto-cleanup 'never)
(add-to-list 'recentf-exclude no-littering-var-directory)
(add-to-list 'recentf-exclude no-littering-etc-directory)
(recentf-mode +1)

(setq history-length 25
      savehist-additional-variables
      '(search-ring regexp-search-ring)
      savehist-autosave-interval 60
      savehist-file (expand-file-name "savehist" no-littering-etc-directory))
(savehist-mode +1)

(electric-pair-mode +1)

;; Auto loadd file on change.
(global-auto-revert-mode +1)
(setq global-auto-revert-non-file-buffers t)

;; built-in packages
(set-face-background 'show-paren-match "#262b36")
(set-face-bold 'show-paren-match t)
(set-face-foreground 'show-paren-match "#ffffff")
(show-paren-mode +1)

(setq-default display-line-numbers-grow-only t
	      display-line-numbers-type 'relative
	      display-line-numbers-width 2)
(global-display-line-numbers-mode +1)

;; Dired
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-dwim-target t)

;; The alias to save life.
(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(require 'init-basic)
(require 'init-prog)
(require 'custom-keybindings)
