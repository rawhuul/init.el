;; Ligature for fonts.

(use-package ligature
  :straight (ligature :type git :host github :repo "mickeynp/ligature.el")
  :config
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
  (global-ligature-mode t))

;; Very powerful undo/redo system.
(use-package undo-tree
  :config
  (setq undo-tree-auto-save-history t)
  (global-undo-tree-mode +1))

;; Highlight your indentation to make things more simple.
(use-package highlight-indent-guides
  :config
  (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  (set-face-background 'highlight-indent-guides-even-face "dimgray")
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

;; Well, it's intresting tho.
(use-package markdown-mode)

;; Using icons.
(use-package all-the-icons
  :config
  (use-package all-the-icons-completion
    :config (all-the-icons-completion-mode)
    (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))
  (use-package all-the-icons-dired
    :hook (dired-mode))
  )

;; A warm theme.
(straight-use-package 'doom-themes)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
    (load-theme 'doom-wilmersdorf t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; Perfect modeline.
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-encoding nil))

;; Popup that makes life easier.
(use-package which-key
  :init(which-key-mode +1))

;; Easily select items.
(use-package vertico
  :init(vertico-mode +1))

;; Emacs completion style enhancement. 
(use-package orderless
  :custom (completion-styles '(orderless)))

;; Enrich completion list with annotations.
(use-package marginalia
  :init (marginalia-mode +1))

;; Commands based on the Emacs completion.
(use-package consult)

;; Text completion framework.
(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  
  (defvar my-company-point nil)
  (advice-add 'company-complete-common :before (lambda () (setq my-company-point (point))))
  (advice-add 'company-complete-common :after (lambda ()
  		  				(when (equal my-company-point (point))
  			  			  (yas-expand))))

  (setq company-minimum-prefix-length 1
	company-ideal-dealy 0.0
	company-tooltip-align-annotations t
	company-selection-wrap-around t)
  (company-tng-configure-default))

(provide 'init-basic)
