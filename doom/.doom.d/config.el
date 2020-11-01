;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Max Salminen"
      user-mail-address "max.salminen@smartly.io")

(setq auth-sources '("~/.authinfo"))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Zero delay suggestions
(setq which-key-idle-delay 0.3)

(setq magit-list-refs-sortby "-committerdate") ; Sort branches by last commit

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)
(setq-hook! 'web-mode +format-with-lsp nil)

;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
(with-eval-after-load 'git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  ;; force update evil keymaps after git-timemachine-mode loaded
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))

(defun make-juutuub-link (youtube-id)
  (browse-url (concat "http://ww.youtube.com/embed" youtube-id)))

(after! org
  (org-add-link-type "juutuub" #'make-juutuub-link)
  (setq
   org-directory "~/Sync/Org/"
   org-todo-keywords '((sequence "TODO(t)" "WIP(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
   org-todo-keyword-faces '(("TODO" :foreground "#20c997" :weight normal :underline t)
                            ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
                            ("WIP" :foreground "#0098dd" :weight normal :underline t)
                            ("DONE" :foreground "#50a14f" :weight normal :underline t)
                            ("CANCELLED" :foreground "#ff6480" :weight normal :underline t)
                            )
   org-log-done 'time
   org-agenda-files (list "~/Sync/Org/" "~/Sync/Org/smartly")
   )
  )
