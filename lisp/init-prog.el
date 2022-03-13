;; Yoo, markdown is quite simple.
(straight-use-package 'markdown-mode)

;; Emacs knocking off vscode.
(straight-use-package 'eglot)
(require 'eglot)
(add-hook 'eglot--managed-mode-hook (lambda () (add-hook 'before-save-hook #'eglot-format-buffer nil nil)))

;; C, forever.
(add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd")))
(add-hook 'c-mode-hook #'eglot-ensure)
;; Pure, nonsense.
(add-hook 'c++-mode-hook #'eglot-ensure)

;; Ufff, gangsta here.
(straight-use-package 'haskell-mode)
(add-to-list 'eglot-server-programs '((haskell-mode) . ("haskell-language-server")))
(add-hook 'haskell-mode-hook #'eglot-ensure)

;; For builder, by builder.
(straight-use-package 'cmake-mode)

;; Feeding Snakes.
(add-hook 'python-mode-hook #'eglot-ensure)

;; Cute fiddly language.
(straight-use-package 'rust-mode)
(setq rust-format-on-save t)
(add-to-list 'eglot-server-programs '((rust-mode) . ("rust-analyzer")))
(add-hook 'rust-mode-hook #'eglot-ensure)
(add-hook 'rust-mode-hook #'(lambda() (prettify-symbols-mode)))

;; It's where I live
(straight-use-package 'shfmt)
(add-hook 'sh-mode-hook 'shfmt-on-save-mode)

;; Yes, even in 2022
(straight-use-package 'php-mode)

;; Ahh!! It's very sweet.
(straight-use-package 'dockerfile-mode)

;; Go colorful with Tree-sitter.
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(global-tree-sitter-mode) 
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Less strokes, more completions.
(straight-use-package 'yasnippet-snippets)
(yas-global-mode +1)
(straight-use-package 'emmet-mode)

;; What's a developer without a terminal.
(straight-use-package 'vterm)
(straight-use-package 'vterm-toggle)
(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))

(provide 'init-prog)
