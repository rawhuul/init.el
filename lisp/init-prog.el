;; Just Developers Things.
(use-package button-lock)
(use-package fixmee
  :after button-lock
  :init (global-fixmee-mode +1))


;; Emacs as IDE Setup.
(use-package eglot
  :config
  (add-hook 'eglot--managed-mode-hook #'(lambda () (add-hook 'before-save-hook 'eglot-format nil t))))

;; For C/C++.
(add-to-list 'eglot-server-programs '((c-modee c++-mode) . ("clangd" "--clang-tidy")))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
;; For Python.
(add-to-list 'eglot-server-programs '((python-mode) . ("pyls")))
(add-hook 'python-mode-hook 'eglot-ensure)
;; For Rust.
(use-package rust-mode)
(add-to-list 'eglot-server-programs '((rust-mode) . ("rust-analyzer")))
(add-hook 'rust-mode-hook 'eglot-ensure)

;; Go colorful with Tree-sitter.
(use-package tree-sitter
  :init (global-tree-sitter-mode)
  :config
  (use-package tree-sitter-langs)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Best GIT interface ever, Magit.
(use-package magit)

;; Terminal.
(use-package vterm
  :config
  (use-package vterm-toggle)
  (add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1))))

;; Snippets
(use-package yasnippet-snippets
  :init (yas-global-mode +1))

(provide 'init-prog)
