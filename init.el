;; init.el

;; Code:

(setq package-enable-at-startup nil)
(setq native-comp-deferred-compilation t)
(setq package-native-compile t)
(setq gc-cons-threshold (* 150 1000 1000))
(setq read-process-output-max (* 1024 1024))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq frame-title-format (concat "ᕙ༼◕ ᴥ ◕༽ᕗ"))
(add-to-list 'default-frame-alist '(height . 34))
(add-to-list 'default-frame-alist '(width . 70))

(set-face-attribute 'default nil
                    :family "CascadiaCode"
                    :height 106
                    :weight 'normal
                    :width 'normal)

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

(global-hl-line-mode +1)
(global-visual-line-mode +1)
(global-prettify-symbols-mode +1)

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

;; Ligature for fonts.
(straight-use-package
 '(ligature :type git :host github :repo "mickeynp/ligature.el"))

(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                     ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                     "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                     "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                     "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                     "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                     "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                     "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                     ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                     "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                     "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                     "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                     "\\\\" "://"))
(global-ligature-mode t)

;; Have some emotions XD.
(straight-use-package 'emojify)

;; Very powerful undo/redo system.
(straight-use-package 'undo-tree)
(global-undo-tree-mode +1)

;; Highlight your indentation to make things more simple.
(straight-use-package 'highlight-indent-guides)
(require 'highlight-indent-guides)
(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "dimgray")
(set-face-foreground 'highlight-indent-guides-character-face "dimgray")
(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Using icons.
(straight-use-package 'all-the-icons)
(straight-use-package 'all-the-icons-completion)
(all-the-icons-completion-mode)
(add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)
(straight-use-package 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; A warm theme.
(straight-use-package 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-one-light t)

;; OHhhh, this modeline
(straight-use-package 'doom-modeline)
(add-hook 'after-init-hook #'doom-modeline-mode)

;; Making things a lot easy.
(straight-use-package 'vertico)
(vertico-mode +1)

(straight-use-package 'marginalia)
(marginalia-mode +1)

;; Emacs completion style enhancement.
(straight-use-package 'orderless)
(setq completion-styles '(orderless))

;; Commands based on the Emacs completion.
(straight-use-package 'consult)

;; Text completion framework.
(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)

(defvar my-company-point nil)
(advice-add 'company-complete-common :before (lambda () (setq my-company-point (point))))
(advice-add 'company-complete-common :after (lambda ()
  		  			      (when (equal my-company-point (point))
  			  			(yas-expand))))

(setq company-minimum-prefix-length 1
      company-ideal-dealy 0.0
      company-tooltip-align-annotations t
      company-selection-wrap-around t)
(company-tng-configure-default)

;; Woohh, present at multiple places at same time, like multiverse.
(straight-use-package 'multiple-cursors)
(multiple-cursors-mode +1)

;; Auto delimiter pairing
(add-hook 'prog-mode-hook 'electric-pair-local-mode)

;; Yoo, markdown is quite simple.
(straight-use-package 'markdown-mode)

;; Emacs knocking off vscode.
(straight-use-package 'eglot)
(require 'eglot)
(add-hook 'eglot--managed-mode-hook (lambda () (add-hook 'before-save-hook #'eglot-format-buffer nil nil)))

;; C, forever.
(add-hook 'c-mode-hook #'eglot-ensure)
;; Pure, nonsense.
(add-hook 'c++-mode-hook #'eglot-ensure)

;; Feeding Snakes.
(add-hook 'python-mode-hook #'eglot-ensure)

;; Cute fiddly language.
(straight-use-package 'rust-mode)
(add-hook 'rust-mode-hook #'eglot-ensure)

;; Go colorful with Tree-sitter.
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(global-tree-sitter-mode) 
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Even code folds
(straight-use-package
 '(ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold"))
(add-hook 'tree-sitter-after-on-hook #'ts-fold-indicators-mode)

;; Less strokes, more completions.
(straight-use-package 'yasnippet-snippets)
(setq yas-also-auto-indent-first-line t)
(setq yas-also-indent-empty-lines t)
(yas-global-mode +1)

;; What's a developer without a terminal.
(straight-use-package 'vterm)
(straight-use-package 'vterm-toggle)
(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))

;; The alias to save life.
(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; Chopping my fingers.
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-x C-b") 'consult-buffer)
(global-set-key [C-f2] 'vterm-toggle-cd)

;; Keybindings to enter in Multiverse.
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
