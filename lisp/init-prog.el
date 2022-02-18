;; Just Developers Things.
(straight-use-package 'button-lock)
(require 'button-lock)
(straight-use-package 'fixmee)
(global-fixmee-mode +1)

;; Making mess look good.
(straight-use-package 'apheleia)

;; Emacs knocking off vscode.
(straight-use-package 'lsp-mode)
(require 'lsp-mode)

;; C, forever.
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c-mode-hook #'(lambda ()
			     (add-hook 'before-save-hook #'lsp-format-buffer t t)))

;; Pure, nonsense.
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'(lambda ()
			     (add-hook 'before-save-hook #'lsp-format-buffer t t)))

;; For Python.
(add-hook 'python-mode-hook #'lsp)
(add-hook 'python-mode-hook 'apheleia-mode)

;; For Rust.
(straight-use-package 'rust-mode)
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'(lambda() (prettify-symbols-mode)))

;; Just type safe nothing else, and there's no way back -_-
(straight-use-package 'typescript-mode)
(add-hook 'typescript-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'apheleia-mode)
(add-hook 'js-mode-hook #'lsp)
(add-hook 'js-mode-hook #'apheleia-mode)

;; Future is here.
(straight-use-package 'web-mode)

;; Can't describe this in words, but hats off, it's turu love.
(define-derived-mode svelte-mode web-mode "Svelte"
  "Svelte is amazing.")

(defun custom-svelte-mode-hook ()
  "Hooks for Svelte mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'svelte-mode-hook 'custom-svelte-mode-hook)

(add-to-list 'auto-mode-alist '("\\.svelte\\'" . svelte-mode))
(add-hook 'svelte-mode-hook #'lsp)
(add-hook 'svelte-mode-hook #'emmet-mode)
(add-hook 'svelte-mode-hook #'apheleia-mode)

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
