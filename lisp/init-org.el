;; #Blessed
(straight-use-package '(org :type built-in))

;; Doesn't first impression matters??
(setq org-startup-indented t)
(setq org-pretty-entities t)
(setq org-hide-emphasis-markers t)
(setq org-startup-with-inline-images t)
(setq org-image-actual-width '(300))

;; Makes sense.
(add-hook 'org-mode-hook 'org-indent-mode)

;; Bells to organized mode
(straight-use-package 'org-superstar)
(setq org-superstar-special-todo-items t)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; Useful to see links.
(straight-use-package 'org-appear)
(add-hook 'org-mode-hook 'org-appear-mode)

;; Hotness!
(straight-use-package
 '(org-roam-ui :host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out") ))

(setq org-roam-ui-sync-theme t)
(setq org-roam-ui-follow t)    
(setq org-roam-ui-update-on-save t)
(setq org-roam-ui-open-on-start t)

(provide 'init-org)
