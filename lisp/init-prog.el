;; Just Developers Things.
(straight-use-package 'button-lock)
(require 'button-lock)
(straight-use-package 'fixmee)
(global-fixmee-mode +1)

;; LSP, Emacs as IDE Setup.
(straight-use-package 'lsp-mode)
(require 'lsp-mode)

;; For C & C++.
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)

;; For Python.
(add-hook 'python-mode-hook #'lsp)

;; For Rust.
(straight-use-package 'rust-mode)
(add-hook 'rust-mode-hook #'lsp)

;; Go colorful with Tree-sitter.
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(global-tree-sitter-mode) 
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Best GIT interface ever, Magit.
(straight-use-package 'magit)

;; Terminal.
(straight-use-package 'vterm)
(straight-use-package 'vterm-toggle)
(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))

;; Snippets
(straight-use-package 'yasnippet-snippets)
(yas-global-mode +1)

(provide 'init-prog)
