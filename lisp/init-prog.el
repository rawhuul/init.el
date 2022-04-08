;; Auto delimiter pairing
(add-hook 'prog-mode-hook 'electric-pair-local-mode)

;; Yoo, markdown is quite simple.
(straight-use-package 'markdown-mode)

;; Emacs knocking off vscode.
(straight-use-package 'eglot)
(require 'eglot)
(add-hook 'eglot--managed-mode-hook (lambda () (add-hook 'before-save-hook #'eglot-format-buffer nil nil)))

;; C, forever.
(add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd" "--all-scopes-completion" "--header-insertion-decorators=0" "--completion-style=bundled" "--header-insertion=iwyu" "--clang-tidy")))
(add-hook 'c-mode-hook #'eglot-ensure)
;; Pure, nonsense.
(add-hook 'c++-mode-hook #'eglot-ensure)

;; For builder, by builder.
(straight-use-package 'cmake-mode)

;; Feeding Snakes.
(add-hook 'python-mode-hook #'eglot-ensure)

;; Cute fiddly language.
(straight-use-package 'rust-mode)
(add-hook 'rust-mode-hook #'eglot-ensure)

;; Just some typess..
(straight-use-package 'typescript-mode)
(add-to-list 'eglot-server-programs '((js-mode typescript-mode) . (eglot-deno "deno" "lsp")))

(defclass eglot-deno (eglot-lsp-server) ()
  :documentation "A custom class for deno lsp.")

(cl-defmethod eglot-initialization-options ((server eglot-deno))
  "Passes through required deno initialization options"
  (list :enable t
	:lint t))

(add-hook 'js-mode-hook #'eglot-ensure)
(add-hook 'typescript-mode-hook #'eglot-ensure)

;; It's where I live
(straight-use-package 'shfmt)
(add-hook 'sh-mode-hook 'shfmt-on-save-mode)

;; Yes, even in 2022
(straight-use-package 'php-mode)

;; Ahh!! It's very sweet.
(straight-use-package 'dockerfile-mode)

;; Less strokes, more completions.
(straight-use-package 'yasnippet-snippets)
(setq yas-also-auto-indent-first-line t)
(setq yas-also-indent-empty-lines t)
(yas-global-mode +1)

;; What's a developer without a terminal.
(straight-use-package 'vterm)
(straight-use-package 'vterm-toggle)
(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))

(provide 'init-prog)
