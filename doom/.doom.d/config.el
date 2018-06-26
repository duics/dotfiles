;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Iosevka" :size 13))
(setq css-indent-offset 2)
(setq css-indent-level 2)
(setq js-indent-level 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq evil-shift-round nil)
(setq evil-shift-width 2)
(setq-default evil-shift-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq tab-width 2)
(global-whitespace-mode)

(add-hook 'js2-mode-hook
		  (lambda ()
			(setq
				js2-basic-offset 2
				sgml-basic-offset 2
				standard-indent 2
				tab-width 2
				indent-tabs-mode nil
				js-indent-level 2
				js2-basic-offset 2
				js2-strict-semi-warning nil
				js2-missing-semi-one-line-override nil
				web-mode-markup-indent-offset 2
				web-mode-css-indent-offset 2
				web-mode-code-indent-offset 2
				web-mode-indent-style 2
				evil-shift-width 2
				)))

(add-hook 'rjsx-mode-hook
		  (lambda ()
			(setq
				js2-basic-offset 2
				sgml-basic-offset 2
				standard-indent 2
				tab-width 2
				indent-tabs-mode nil
				js-indent-level 2
				js2-basic-offset 2
				js2-strict-semi-warning nil
				js2-missing-semi-one-line-override nil
				web-mode-markup-indent-offset 2
				web-mode-css-indent-offset 2
				web-mode-code-indent-offset 2
				web-mode-indent-style 2
				evil-shift-width 2
				)))

(add-hook 'elixir-mode-hook
		  (lambda ()
			(setq evil-shift-width 2)))
