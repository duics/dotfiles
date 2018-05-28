;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Monoisome" :size 12))
(setq css-indent-offset 2)
(setq css-indent-level 2)
(setq js-indent-level 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq evil-shift-round nil)
(setq evil-shift-width 2)
(setq-default indent-tabs-mode t)
(setq indent-tabs-mode t)
(setq tab-width 2)

(add-hook 'js2-mode-hook
		  (lambda ()
			(setq js2-basic-offset 2)
			(setq evil-shift-width 2)))
(add-hook 'elixir-mode-hook
		  (lambda ()
			(setq evil-shift-width 2)))
