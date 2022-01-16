;; Just Developers Things.
(straight-use-package 'button-lock)
(require 'button-lock)
(straight-use-package 'fixmee)
(global-fixmee-mode +1)


;; Emacs as IDE Setup.
(straight-use-package 'eglot)
(require 'eglot)
(add-hook 'eglot--managed-mode-hook #'(lambda () (add-hook 'before-save-hook 'eglot-format nil t)))

;; For C & C++.
(add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd" "--clang-tidy")))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
;; For Python.
(add-to-list 'eglot-server-programs '((python-mode) . ("pyls")))
(add-hook 'python-mode-hook 'eglot-ensure)

;; For Rust.
(straight-use-package 'rust-mode)
(add-to-list 'eglot-server-programs '((rust-mode) . ("rust-analyzer")))
(add-hook 'rust-mode-hook 'eglot-ensure)

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
