
;; Keybindings
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-x C-b") 'consult-buffer)
(global-set-key [C-f2] 'vterm-toggle-cd)

(provide 'custom-keybindings)
