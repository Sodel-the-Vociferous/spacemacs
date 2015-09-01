;;; packages.el --- spotify Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Brian Hicks & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar misc-packages
  '(
    aes
    ascii
    async
    async-bytecomp
    auto-dim-other-buffers
    autorevert
    auto-compile
    bash-completion
    browse-kill-ring
    charmap
    concurrent
    crontab-mode
    csv-mode
    ctable
    dash
    deferred
    dired+
    dired-efap
    dired-single
    doc-view
    ebib
    ;; elfeed
    ;; elfeed-org
    evil-rsi
    expand-region
    f
    flycheck
    flycheck-rust
    flylisp
    flyspell
    ;; git-blame
    ;; git-commit
    ;; git-rebase
    ;; gitconfig-mode
    ;; gitignore-mode
    helm-company
    ))


(defun misc/init-misc ()
  (add-hook 'asm-mode-hook
            (lambda ()
              (set (make-local-variable 'paragraph-start)
                   "^\\s-*;+.*$")))

  (diminish 'auto-dim-other-buffers-mode)
  (auto-dim-other-buffers-mode)

  (global-auto-revert-mode t)

  (auto-compile-on-save-mode)
  (auto-compile-on-load-mode)

  (bash-completion-setup)

  (setq
   c-default-style "K&R"
   c-basic-offset 4
   tab-width 4
   indent-tabs-mode nil)

  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . doc-view-mode))
  (add-to-list 'auto-mode-alist '("\\.ps\\'" . doc-view-mode))
  (setq doc-view-continuous t)

  (add-to-list 'auto-mode-alist '("\\.bib\\'" . ebib))

  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

  (use-package ess
    :defer t
    :commands julia
    :config (progn
              (require 'ess-site)
              (setq
               ess-directory "~/.ess/"
               ess-ask-for-ess-directory nil)))

  (evil-rsi-mode)

  (bind-key "C-=" 'er/expand-region)

  (global-flycheck-mode 1)

  (add-hook 'rust-mode-hook 'flycheck-rust-setup)

  (defun enable-flylisp-mode ( )
    (interactive)
    (flylisp-mode 1))

  (add-hook 'emacs-lisp-mode-hook 'enable-flylisp-mode)
  (add-hook 'lisp-mode-hook 'enable-flylisp-mode)

  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)

                                        ;(global-git-commit-mode))

  ("C-x d" . helm-find-files)
  ("C-y" . helm-show-kill-ring)
  ("C-h a" . helm-apropos)
  ;; ("C-z <C-SPC>" . helm-mark-ring) ; TODO use evil leader
  ;; ("C-z <C-SPC>" . helm-global-mark-ring)
  (bind-key "<tab>" 'helm-execute-persistent-action helm-map)
  (bind-key "<C-tab>" 'helm-select-action helm-map)

  (setq helm-google-suggest-use-curl-p t)

  (bind-key "<C-tab>" 'helm-company)

  ;; (helm-gtags
  ;;  :demand t
  ;;  :require (helm ggtags)
  ;;  :init (progn
  ;;            (defun helm-gtags-update-tags-quietly ()
  ;;              (flet ((message (&rest _) nil))
  ;;                (helm-gtags-update-tags)))

  ;;            (define-minor-mode helm-gtags-auto-update-mode
  ;;              "Auto update GTAGS when a file in this mode is saved."
  ;;              :init-value nil
  ;;              :group 'helm-gtags-update
  ;;              (if helm-gtags-auto-update-mode
  ;;                  (progn
  ;;                    (add-hook 'after-save-hook 'helm-gtags-update-tags-quietly nil :local))
  ;;                (remove-hook 'after-save-hook 'helm-gtags-update-tags-quietly t)))

  ;;            (defun enable-helm-gtags-auto-update-mode()
  ;;              "Turn on `helm-gtags-auto-update-mode'."
  ;;              (interactive)
  ;;              (helm-gtags-auto-update-mode 1))

  ;;            (add-hook 'dired-mode-hook 'helm-gtags-mode)
  ;;            (add-hook 'prog-mode-hook 'helm-gtags-mode)
  ;;            (add-hook 'prog-mode-hook 'enable-helm-gtags-auto-update-mode))

  ;;  :config (progn
  ;;            (require 'ggtags)

  ;;            (setq
  ;;             helm-gtags-ignore-case t
  ;;             helm-gtags-auto-update t
  ;;             helm-gtags-use-input-at-cursor t
  ;;             helm-gtags-pulse-at-cursor t
  ;;             helm-gtags-suggested-key-mapping t)

  ;;            (bind-key "M-." 'helm-gtags-find-tag helm-gtags-mode-map)
  ;;            (bind-key "M-?" 'helm-gtags-find-pattern helm-gtags-mode-map)))

  (setq
   projectile-find-file-hook (lambda () (projectile-invalidate-cache nil))
   projectile-enable-caching t
   projectile-completion-system 'helm
   projectile-find-dir-includes-top-level t
   projectile-switch-project-action 'projectile-vc)

  (if (eq system-type 'cygwin)
      (setq projectile-switch-project-action 'projectile-dired))

  ;; Rebind this, because the helm version doesn't work
  ;; outside of project dirs.
  (bind-key "C-z p F" 'projectile-find-file-in-known-projects projectile-mode-map)

  ;; (markdown-mode
  ;;  :defer t
  ;;  :mode "\\.md\\'"
  ;;  :require electric
  ;;  :config (progn
  ;;            (require 'markdown-mode+)
  ;;            (setq markdown-enable-math t) ; LaTeX math
  ;;            ;; Electric-indent buggers indentation up in markdown-mode
  ;;            (add-hook 'electric-indent-functions
  ;;                      (lambda (_unused) 'no-indent) nil 'local)))
  ;; (markdown-mode+
  ;;  :defer t
  ;;  :require markdown-mode)
  ;; ;; (marmalade)
  ;; (notmuch :defer t)
  ;; (notmuch-labeler :defer t)
  ;; (nxml
  ;;  :defer t
  ;;  :mode "\\.xml'"
  ;;  :config (setq nxml-child-indent 2))
  (use-package org
    :defer t
    :mode ("\\.\\(org\\|org_archive\\)\\'" . org-mode)
    :commands (org-agenda org-iswitchb)
    :bind (("C-z C-o ]" . outline-next-heading)
           ("C-z C-o [" . outline-previous-heading)
           ("C-z C-o a" . org-agenda)
           ("C-z C-o b" . user/org-iswitchb-agenda)
           ("C-z C-o j" . org-clock-goto)
           ("C-z C-o l" . org-store-link)
           ("C-z C-o o" . org-clock-out)
           ("C-z C-o <C-right>" . org-demote-subtree)
           ("C-z C-o <C-left>" . org-promote-subtree))
    ;; :idle (require 'org)
    :init (defun user/org-iswitchb-agenda ()
            "call `org-iswitchb' with two prefix args, restricting selection
            to agenda files."
            (interactive)
            (org-iswitchb 14))
    :config (progn
              ;; (require 'org-journal)
              ;; (require 'org-toc)

              (add-hook-progn 'org-mode-hook (flycheck-mode -1))

              ;; For `helm-show-kill-ring'
              (unbind-key "C-y" org-mode-map)

              ;; Default binding for <C-tab> is dumb. I want
              ;; `helm-company', dammit!
              (unbind-key "<C-tab>" org-mode-map)
              (bind-key "<C-M-tab>" 'org-force-cycle-archived org-mode-map)

              ;; Make "C-z C-o a <RET>" display an overview of all
              ;; tasks in my agenda files.
              (setq
               org-agenda-custom-commands
               '(("" "Agenda Tasks"
                  ((agenda "" ((org-agenda-overriding-header "== Agenda ==")))
                   (tags-todo "/+WIP" ((org-agenda-overriding-header "Tasks In Progress")
                                       (org-agenda-todo-ignore-deadlines t)
                                       (org-tags-match-list-sublevels t)))
                   (tags-todo "-meta/NEXT" ((org-agenda-overriding-header "Next Tasks")
                                            (org-tags-match-list-sublevels t)))
                   (tags-todo "/+OnHOLD" ((org-agenda-overriding-header "Tasks On Hold")))
                   (tags-todo "/+TODO" ((org-agenda-overriding-header "Tasks")
                                        (org-agenda-skip-function '(org-agenda-skip-entry-if
                                                                    'scheduled 'deadline))))
                   (tags-todo "/FUTURE" ((org-agenda-overriding-header "Future Tasks")
                                         (org-agenda-todo-ignore-scheduled t)
                                         (org-agenda-todo-ignore-deadlines t)))
                   (tags "+REFILE/" ((org-agenda-overriding-header "Tasks to Refile")
                                     (org-tags-match-list-sublevels nil)))
                   (tags "-archived-event/DONE|CANCELLED" ((org-agenda-overriding-header "Tasks to Archive"))))
                  nil)))

              (setq

               ;; Render special formatting in buffer
               org-pretty-entities t
               org-pretty-entities-include-sub-superscripts t
               org-columns-default-format (concat "%45ITEM "
                                                  "%TODO "
                                                  "%3PRIORITY "
                                                  "%6Effort(Effort){:} "
                                                  "%6CLOCKSUM(Time){:}")

               ;; Org Capture
               org-default-notes-file "~/personal/refile.org"
               org-cycle-separator-lines 2

               ;; Org Journal
               org-journal-dir "~/org/journal/"

               ;; Org Agenda
               org-agenda-start-on-weekday nil
               org-agenda-start-with-clockreport-mode nil
               org-agenda-start-with-log-mode t
               org-agenda-skip-additional-timestamps-same-entry t
               org-agenda-dim-blocked-tasks nil
               org-agenda-overriding-columns-format (concat "%CATEGORY "
                                                            "%45ITEM "
                                                            "%TODO "
                                                            "%3PRIORITY "
                                                            "%6Effort(Effort){:} "
                                                            "%6CLOCKSUM(Time){:}")
               org-agenda-remove-tags 'prefix
               org-agenda-sorting-strategy '((agenda time-up priority-down habit-down category-up)
                                             (todo priority-down category-up todo-state-up)
                                             (tags priority-down category-up todo-state-up)
                                             (search priority-down category-up todo-state-up))
               org-agenda-window-setup 'same-window

               ;; When prompting for an org-mode path, construct the path
               ;; incrementally.
               org-outline-path-complete-in-steps nil
               org-refile-use-outline-path 'file
               ;; When refiling to a parent node that doesn't exist, prompt to
               ;; create it.
               org-refile-allow-creating-parent-nodes 'confirm
               org-completion-use-ido t
               ido-everywhere t
               ido-max-directory-size 100000

               ;; Tags

               ;; Don't make children inherit "prj" tag from parent items
               org-tags-exclude-from-inheritance '("prj")

               ;; State Workflow
               org-todo-keywords '(;; Work Statuses
                                   (sequence "FUTURE(f)"
                                             "OnHOLD(h@/!)"
                                             "TODO(t@)"
                                             "NEXT(n@)"
                                             "WIP(w@)"
                                             "|"
                                             "DONE(d@)")
                                   ;; Extraordinary Statuses
                                   (sequence "|" "CANCELLED(c@)"))

               ;; Export

               org-latex-pdf-process '("latexmk -bibtex -pdf %f && latexmk --bibtex -c")
               org-export-creator-info nil
               org-export-with-sub-superscripts t
               ;; When exporting to ODT, convert it to a PDF, too
               org-export-odt-preferred-output-format "pdf"
               ;; Remove logfiles after exporting a PDF
               org-export-pdf-remove-logfiles t

               ;; Time/Clocking

               ;; Don't prompt for a note when clocking out
               org-log-note-clock-out nil
               org-clock-clocktable-default-properties '(:maxlevel 4 :scope file)
               ;; Don't always default to dates in the future
               org-read-date-prefer-future nil
               org-clock-out-remove-zero-time-clocks t
               org-clock-persist t
               ;; Do not prompt to resume an active clock
               org-clock-persist-query-resume nil
               ;; Include current clock task in clock reports
               org-clock-report-include-clocking-task t
               org-edit-timestamp-down-means-later nil
               org-log-done 'time
               org-log-into-drawer t
               org-time-clocksum-format (list :hours "%d"
                                              :require-hours t
                                              :minutes ":%02d"
                                              :require-minutes t)))))
;; (use-package org-capture
;;   :ensure t
;;   :defer t
;;   :bind ("C-z C-o C-c" . org-capture))
;; (outline-magic)
;; (outline-mode
;;  :defer t
;;  :config (progn
;;            (bind-key "<C-down>" 'outline-next-visible-heading outline-minor-mode-map)
;;            (bind-key "<C-up>" 'outline-previous-visible-heading outline-minor-mode-map)
;;            (bind-key "<M-down>" 'outline-move-subtree-down outline-minor-mode-map)
;;            (bind-key "<M-up>" 'outline-move-subtree-up outline-minor-mode-map)
;;            (bind-key "<M-left>" 'outline-promote outline-minor-mode-map)
;;            (bind-key "<M-right>" 'outline-demote outline-minor-mode-map)
;;            (bind-key "<C-M-tab>" 'outline-cycle outline-minor-mode-map)))
;; (package+)
;; (paren
;;  :config (show-paren-mode t))
;; (persistent-soft)
;; (pg :defer t)
;; (pkg-info)
;; (popup :defer t)
;; (pyflakes :defer t)
;; (pylint
;;  :defer t
;;  :commands pylint
;;  :config (progn
;;            (setq
;;             pylint-command "pylint"
;;             pylint-options '("-E" "--reports=n" "--output-format=parseable"))))
;; (python
;;  :defer t
;;  :commands python-mode
;;  :mode ("\\.py\\'" . python-mode))
;; (python-pep8 :defer t)
;; (regex-dsl)
;; (request :defer t)
;; (rust-mode
;;  :defer t
;;  :mode "\\.rs\\'")
;; (s)
;; (scala-mode
;;  :defer t
;;  :mode "\\.scala\\'"
;;  :config (scala-mode-feature-electric-mode))
;; (scala-mode2 :defer t)
;; ;; (shell-command :type elpa)
;; (slime
;;  :defer t
;;  :require slime-company
;;  :commands slime
;;  :init (setq inferior-lisp-program "/usr/bin/sbcl")
;;  :config (progn
;;            (slime-setup (cons 'slime-company slime-contribs))
;;            ;; Key bindings
;;            (bind-key "RET" 'newline-and-indent slime-mode-map)))
;; (slime-company
;;  :defer t)
;; (ssh-config-mode :defer t)



;;    (term
;;     :bind ("C-z t" . user/ansi-term)
;;     :init (progn
;;             (defun user/ansi-term ()
;;               (interactive)
;;               (ansi-term "/bin/bash" "shell"))

;;             (defun user/term-send-prev-word ()
;;               (interactive)
;;               (term-send-raw-string "\eb"))

;;             (defun user/term-send-next-word ()
;;               (interactive)
;;               (term-send-raw-string "\ef")))
;;     :config (progn
;;               (bind-key "C-z" 'term-stop-subjob term-raw-escape-map)
;;               (bind-key "<C-left>" 'user/term-send-prev-word term-raw-map)
;;               (bind-key "<C-right>" 'user/term-send-next-word term-raw-map)

;;               (add-hook-progn 'term-mode-hook (evil-local-mode -1))
;;               ;; TODO: make a term-exit-hook instead
;;               (defadvice term-handle-exit
;;                 (after bind-q-to-kill-dead-term activate)
;;                 (read-only-mode)
;;                 (local-set-key (kbd "q") 'kill-buffer-and-window))

;;               ;; Terminals in emacs should be able to run tmux, regardless of
;;               ;; whether or not emacs was started within tmux.
;;               (setenv "TMUX" "")))
;;    (term-run
;;     :bind (("M-!" . term-run-shell-command)
;;            ("C-M-!" . shell-command)))
;;    (tidy
;;     :defer t
;;     :commands tidy-buffer
;;     ;; Tell the tidy command to tidy up XML files; by default,
;;     ;; it complains about XML being "malformed HTML".
;;     :config (setq tidy-shell-command "/usr/bin/tidy -xml"))
;;    (tramp
;;     ;; Theoretically, make TRAMP handle /sudo:root@host: paths by logging
;;     ;; in via the regular TRAMP ssh method, and then `sudo` to root.
;;     :config (setq tramp-default-proxies-alist '(((regexp-quote (system-name)) nil nil)
;;                                                 (nil "\\`root\\'" "/ssh:%h:"))))
;;    (tron-theme
;;     :defer t
;;     :require color-theme
;;     :config (load-theme 'tron-theme t))
;;    (tronesque-theme
;;     :defer t
;;     :require color-theme
;;     :config (load-theme 'tronesque t))
;;    (ucs-utils :defer t)
;;    (undo-tree
;;     :diminish undo-tree-mode
;;     :config (global-undo-tree-mode 1))
;;    (unfill)
;;    (unicode-fonts
;;     :require persistent-soft

;;     :init
;;     (defun my-hook-unicode-fonts-setup (frame)
;;       "Run unicode-fonts-setup, then remove the hook."
;;       (progn
;;         (select-frame frame)
;;         (unicode-fonts-setup)
;;         (message "Removing unicode-fonts-setup to after-make-frame-functions hook")
;;         (remove-hook 'after-make-frame-functions 'my-hook-unicode-fonts-setup)))
;;     ;(add-hook 'after-make-frame-functions 'my-hook-unicode-fonts-setup nil)

;;     :config
;;     (require 'persistent-soft))
;;    (unicode-whitespace)
;;    (vc
;;     :config (setq vc-follow-symlinks t))
;;    (wc-mode :defer t)
;;    (web-beautify :defer t)
;;    (web-mode
;;     :defer t
;;     :mode "\\.\\(p?html?\\|tpl\\|php\\|jsp\\|as[cp]x\\|erb\\)\\'"
;;     :config (setq web-mode-disable-auto-pairing nil))
;;    (window-jump
;;     :bind (("C-z <C-down>" . window-jump-down)
;;            ("C-z <down>" . window-jump-down)
;;            ("C-z <C-up>" . window-jump-up)
;;            ("C-z <up>" . window-jump-up)
;;            ("C-z <C-left>" . window-jump-left)
;;            ("C-z <left>" . window-jump-left)
;;            ("C-z <C-right>" . window-jump-right)
;;            ("C-z <right>" . window-jump-right)))
;;    (wrap-region)
;;    (ws-butler
;;     :diminish (ws-butler-mode)
;;     ;; ws-butler breaks emacs if it's run before the emacs window
;;     ;; starts.
;;     :init (add-hook 'window-setup-hook 'ws-butler-global-mode))
;;    (xclip)
;; )
