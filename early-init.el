;; early-init.el

;; Code:

(setq package-enable-at-startup nil)
(setq native-comp-deferred-compilation t)
(setq package-native-compile t)
(setq gc-cons-threshold (* 150 1000 1000))
(setq read-process-output-max (* 1024 1024))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq frame-title-format (concat "ᕙ༼◕ ᴥ ◕༽ᕗ"))
(add-to-list 'default-frame-alist '(height . 34))
(add-to-list 'default-frame-alist '(width . 70))

(set-face-attribute 'default nil
                    :family "CascadiaCode"
                    :height 106
                    :weight 'normal
                    :width 'normal)
