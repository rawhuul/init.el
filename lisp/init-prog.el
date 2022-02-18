;; Just Developers Things.
(straight-use-package 'button-lock)
(require 'button-lock)
(straight-use-package 'fixmee)
(global-fixmee-mode +1)

;; Emacs knocking off vscode.
(straight-use-package 'lsp-mode)
(require 'lsp-mode)
(defun custom/lsp-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'lsp-mode-hook #'custom/lsp-hooks)

;; C, forever.
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)

;; For Python.
(add-hook 'python-mode-hook #'lsp)

;; For Rust.
(straight-use-package 'rust-mode)
(add-hook 'rust-mode-hook #'lsp)

;; Just type safe nothing else.
(straight-use-package 'typescript-mode)
(add-hook 'typescript-mode-hook #'lsp)

;; There's no way back.
(require 'js-mode)
(add-hook 'js-mode-hook #'lsp)

;; Future is here.
(straight-use-package 'web-mode)

;; Can't describe this in words, but hats off, it's turu love.
(define-derived-mode svelte-mode web-mode "Svelte"
  "Svelte is amazing.")
(add-to-list 'auto-mode-alist '("\\.svelte\\'" . svelte-mode))
(add-hook 'svelte-mode-hook #'lsp)
(add-hook 'svelte-mode-hook #'emmet-mode)

;; Ahh!! It's very sweet.
(straight-use-package 'dockerfile-mode)

;; Go colorful with Tree-sitter.
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(global-tree-sitter-mode) 
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; GIT on steroids.
(straight-use-package 'magit)

;; Terminal, where I live.
(straight-use-package 'vterm)
(straight-use-package 'vterm-toggle)
(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))

;; Less strokes, more completions.
(straight-use-package 'yasnippet-snippets)
(yas-global-mode +1)
(straight-use-package 'emmet-mode)

(provide 'init-prog)
