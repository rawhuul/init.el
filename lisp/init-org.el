(straight-use-package '(org :type built-in))

(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)

(setq org-fontify-quote-and-verse-blocks nil)

(setq org-src-fontify-natively nil
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

(straight-use-package 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

(provide 'init-org)
