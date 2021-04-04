;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(setq custom-file "~/personal/personal.el")

(defmacro add-hook-progn (hook &rest body)
  `(add-hook ,hook
             (lambda () . ,body)))

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     markdown
     erc
     (elfeed :variables rmh-elfeed-org-files '("~/personal/elfeed.org"))
     gtags
	   imenu-list
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete)
     better-defaults
     (c-c++ :variables c-c++-enable-clang-support t)
     python
     common-lisp
     emacs-lisp
     erlang
     git
     html
     ipython-notebook
     javascript
     org
     plantuml
     python
     rust
     shell-scripts
     syntax-checking
     search-engine
     sql
     (version-control :variables version-control-global-margin nil)
     yaml
     )
   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ;; git-blame
                                      ;; git-commit
                                      ;; git-rebase
                                      ;; gitconfig-mode
                                      ;; gitignore-mode
                                      aes
                                      ;; anki-editor
                                      ascii-art-to-unicode
                                      async
                                      auto-async-byte-compile
                                      auto-compile
                                      auto-dim-other-buffers
                                      autorevert
                                      bash-completion
                                      bind-key
                                      browse-kill-ring
                                      calfw
                                      calfw-org
                                      charmap
                                      color-theme
                                      company-irony
                                      concurrent
                                      crontab-mode
                                      csv-mode
                                      ctable
                                      dash
                                      deferred
                                      dired-efap
                                      dired-single
                                      doc-view
                                      ebib
                                      ein
                                      eldoc
                                      elfeed
                                      elfeed-org
                                      emms
                                      evil-collection
                                      evil-rsi
                                      expand-region
                                      f
                                      flycheck
                                      flycheck-irony
                                      flycheck-rust
                                      flylisp
                                      flymake-jslint
                                      flymake-json
                                      flyspell
                                      ggtags
                                      helm-company
                                      helm-gtags
                                      irony
                                      js2-mode
                                      json-mode
                                      json-reformat
                                      list-processes
                                      list-utils
                                      log4e
                                      markdown-mode
                                      markdown-mode+
                                      notmuch
                                      notmuch-labeler
                                      nxml
                                      org-board
                                      org-brain
                                      org-caldav
                                      org-drill
                                      oauth2
									  org-cliplink
                                      org-noter
                                      org-projectile
                                      helm-org
                                      helm-org-rifle
                                      outline-magic
                                      package+
                                      pdf-tools
                                      persistent-soft
                                      pkg-info
                                      popup
                                      flymake-python-pyflakes
                                      pylint
                                      regex-dsl
                                      request
                                      rust-mode
                                      scala-mode
                                      simple-httpd
                                      ;;shell-command
                                      ;; slime
                                      ;; slime-company
                                      ssh-config-mode
                                      term-run
                                        ;tron-theme
                                        ;tronesque-theme
                                      ucs-utils
                                      undo-tree
                                      unfill
                                      visual-fill
                                      visual-fill-column
                                      wc-mode
                                      web-beautify
                                      web-mode
                                      window-jump
                                      wrap-region
                                      ws-butler
                                      xclip
                                      zenburn-theme
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    git-gutter+-mode
                                    powerline
                                    spaceline
                                    evil-search-highlight-persist
									                  )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(500000000 0.3)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   spacemacs-checkversion-branch "develop"

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         solarized-light
                         solarized-dark
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "M-m m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 10
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (setq package-archives '(("org" . "http://orgmode.org/elpa/")
                           ("MELPA" . "http://melpa.org/packages/")
                           ("gnu" . "http://elpa.gnu.org/packages/")))
  (package-initialize)

  ;; Load Private Emacs Config
  (when (file-exists-p custom-file)
    (load custom-file))

  (put 'narrow-to-page 'disabled nil)

  ;; (setq evil-emacs-state-modes (append '(term-mode
  ;;                                        anaconda-mode-view-mode
  ;;                                        ;; elfeed-search-mode
  ;;                                        ;; elfeed-show-mode
  ;;                                        epa-key-list-mode
  ;;                                        git-rebase-mode
  ;;                                        magit-popup-mode
  ;;                                        magit-blame-mode
  ;;                                        magit-key-mode
  ;;                                        magit-status-mode)
  ;;                                      evil-emacs-state-modes)

  ;;       evil-insert-state-modes (append '(org-capture-mode
  ;;                                         global-git-commit-mode
  ;;                                         git-commit-mode
  ;;                                         inferior-ess-mode)
  ;;                                       evil-insert-state-modes))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; Startup & Shutdown
  (setq
   inhibit-startup-screen t
   initial-scratch-message ""
   confirm-kill-emacs 'y-or-n-p)

  (ignore-errors
    (scroll-bar-mode 0)
    (tool-bar-mode 0))
  (menu-bar-mode 0)
  (column-number-mode t)
  (setq-default
   indent-tabs-mode nil
   tab-width 4
   standard-indent 4)

  (defun user/make-font-big ()
    (interactive)
    (set-face-attribute 'default nil :height 240))

  (defun user/make-font-normal ()
    (interactive)
    (set-face-attribute 'default nil :height 140))

  (defun user/make-font-small ()
    (interactive)
    (set-face-attribute 'default nil :height 100))

  (setq recentf-save-file "~/.emacs.d/recentf")

  (setq revert-without-query '(".+"))

  (setq sentence-end-double-space nil)

  (setq shell-command-switch "-lc")

  (use-package company-irony
    :config
    (add-to-list 'company-backends 'company-irony))

  (use-package irony
    :init
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode))

  (use-package flycheck-irony
    :init
    (add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

  (use-package bind-key
    :config
    (progn
      (unbind-key "C-z")
      (unbind-key "<insert>")
      (unbind-key "<insertchar>")
      ;; HALLELUJAH :)
      (bind-key "C-x x" 'delete-window)
      (bind-key "C-x <right>" 'next-buffer)
      (bind-key "C-x <left>" 'previous-buffer)
      (bind-key "C-h a" 'helm-apropos)
      (bind-key* "C-y" 'helm-show-kill-ring)
      ;; (bind-key "C-g" 'keyboard-escape-quit)
      (bind-key "<mouse-3>" 'mouse-popup-menubar)
      (bind-key "<mouse-8>" (kbd "C-x <left>"))
      (bind-key "<mouse-9>" (kbd "C-x <right>"))
      (bind-key "C-h C-M-f" 'find-function)
      (bind-key "C-h C-M-v" 'find-variable)
      (bind-key "C-z C-z" 'suspend-frame)))

  (evil-leader/set-key "s u" 'browse-url)
  (bind-key "C-`" 'evil-emacs-state evil-evilified-state-map)
  (require 'magit)
  (require 'magit-diff)
  (bind-key [remap magit-delete-thing] 'magit-discard magit-hunk-section-map)
  (bind-key "K" 'magit-delete-thing magit-status-mode-map)
  (unbind-key "K" evil-motion-state-map)

  (use-package auto-compile
    :config (progn
              (auto-compile-on-save-mode)
              (auto-compile-on-load-mode)))

  (use-package alpha
    :defer t
    :config (progn
              (add-to-list 'default-frame-alist '(alpha . 100))))

  ;; (use-package asm-mode
  ;;   ;; Make comments work better w/ fill-paragraph
  ;;   :config (add-hook-progn 'asm-mode-hook
  ;;                           (set (make-local-variable 'paragraph-start)
  ;;                                "^\\s-*;+.*$")))
  (use-package auto-async-byte-compile
    :config
    (auto-async-byte-compile-mode 1)
    )
  ;; (auctex
  ;;  :defer t
  ;;  :mode ("\\.tex\\'" . LaTeX-mode)
  ;;  :config (progn
  ;;            (require 'tex)
  ;;            (require 'tex-site)
  ;;            (require 'preview)
  ;;            (add-hook 'LaTeX-mode-hook 'outline-minor-mode)))
  ;; (auctex-latexmk :defer t)
  (use-package auto-dim-other-buffers
    :diminish auto-dim-other-buffers-mode
    :config (auto-dim-other-buffers-mode))
  (use-package autorevert
    :config (global-auto-revert-mode t))
  (use-package auto-compile)
  (use-package bash-completion
    :config (bash-completion-setup))
  (use-package browse-kill-ring)
  (use-package calfw-open-org-calendar
    :commands cfw:open-org-calendar
    :init
    (progn
      (require 'calfw)
      (require 'calfw-org)

      (spacemacs/set-leader-keys "aoC" #'cfw:open-org-calendar)

      (defun user/calfw-org-remove-tags (oldfn &rest args)
        (let ((org-agenda-remove-tags t))
          (apply oldfn args)))

      (advice-add #'cfw:org-collect-schedules-period :around #'user/calfw-org-remove-tags)))
  (use-package cc-mode
    :defer t
    :config (progn
              (setq c-default-style "K&R")
              (setq c-basic-offset 4)
              (setq tab-width 4)
              (setq indent-tabs-mode t)))
  (use-package company
    :diminish company-mode
    :config (progn
              ;; (global-company-mode t)

              (setq
               ;; Helm-company usually pukes if company autocompletion
               ;; starts after helm-company is called.
               company-idle-delay 0.1
               ;; Get rid of company menu. I'll use helm.
               ;; company-frontends
               ;; (remove 'company-pseudo-tooltip-unless-just-one-frontend
               ;;         company-frontends)

               ;; company-elisp-detect-function-context nil
               ;; company-backends '((company-gtags
               ;;                     ;; company-etags
               ;;                     company-elisp
               ;;                     company-files
               ;;                     company-dabbrev
               ;;                     company-dabbrev-code
               ;;                     company-ropemacs)
               ;;                    ;; company-bbdb
               ;;                    ;; company-nxml
               ;;                    ;; company-css
               ;;                    ;; company-clang
               ;;                    ;; company-cmake
               ;;                    company-dabbrev)
               )))
  (use-package csv-mode
    :defer t
    :mode "\\.csv\'")
  (use-package dired-efap)
  (use-package dired-single)
  (use-package pdf-tools
    :defer t
    :config (pdf-tools-install))
  (use-package doc-view
    :defer t
    :mode ("\\.ps\\'" . doc-view-mode)
    :config
    (progn
      (require 'pdf-tools)
      (setq doc-view-continuous t)))
  (use-package ebib
    :defer t
    :mode "\\.bib\\'")
  (use-package eldoc
    :defer t
    :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))
  (use-package elfeed
    :config
    (progn
      ;; (require 'elfeed-search)
      ;; (bind-key "q" 'kill-this-buffer elfeed-search-mode-map)

      (setq elfeed-sort-order 'ascending)

      (evil-define-key '(visual motion) elfeed-search-mode-map "b" 'elfeed-search-browse-url)
      ;; (add-hook-progn
      ;;  'elfeed-search-mode-hook
      ;;  (bind-key "b" 'elfeed-search-browse-url evil-visual-state-local-map))

      (setq-default elfeed-search-filter "@2-weeks-ago -skip +unread +daily ")))

  (use-package elfeed-org
    :config (elfeed-org))

  (setq
   erc-port 6697
   erc-prompt-for-password t
   erc-mode-line-format "%t %a"
   erc-kill-queries-on-quit t
   erc-kill-buffer-on-part t
   erc-enable-logging t
   erc-log-write-after-insert t
   erc-log-write-after-send t
   erc-log-channels-directory (concat "~/doc/chats/" system-name "-irc/")
   erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE")
   erc-image-inline-rescale 'window
   erc-prompt-for-nickserv-password nil)

  (add-hook-progn
   'erc-mode-hook
   (flyspell-mode)
   (erc-image-disable)
   (erc-youtube-disable))

  (use-package erlang-mod
    :defer t
    :mode "\\.erl\\'"
    :config (progn
              (setq
               erlang-root-dir "/usr/lib/erlang"
               exec-path (cons "/usr/lib/erlang/bin" exec-path))))

  (evil-leader/set-key "ase" 'eshell)
  (setq eshell-cmpl-cycle-completions t)

  (add-hook
   'eshell-mode-hook
   (lambda ()
     (evil-local-mode -1)
     (company-mode -1)

     (bind-key "TAB" 'helm-esh-pcomplete eshell-mode-map)
     (bind-key "<tab>" 'helm-esh-pcomplete eshell-mode-map)))

  (use-package ess
    :defer t
    :commands julia
    :config (progn
              (require 'ess-site)
              (setq
               ess-directory "~/.ess/"
               ess-ask-for-ess-directory nil)))

  (unbind-key "q" evil-normal-state-map)
  (unbind-key "C-e" evil-insert-state-map)

  (unbind-key "C-d" evil-insert-state-map)
  (unbind-key "C-k" evil-insert-state-map)
  (bind-key "C-g" 'evil-normal-state evil-insert-state-map)
  (bind-key "C-c" 'evil-normal-state evil-visual-state-map)

  (unbind-key "C-e" evil-motion-state-map)

  (bind-key "C-c" 'evil-exit-visual-state evil-visual-state-map)
  (unbind-key "M-." evil-normal-state-map)

  ;; For gtags
  (unbind-key "M-." evil-visual-state-map)
  (unbind-key "C-y" evil-motion-state-map)

  ;; For helm
  (unbind-key "C-y" evil-insert-state-map)

  (set-default 'evil-symbol-word-search t)
  (add-hook-progn 'git-commit-mode-hook (evil-insert-state))

  ;; (setq evil-emacs-state-modes (append '(term-mode
  ;;                                        anaconda-mode-view-mode
  ;;                                        ;; elfeed-search-mode
  ;;                                        ;; elfeed-show-mode
  ;;                                        epa-key-list-mode
  ;;                                        git-rebase-mode
  ;;                                        magit-popup-mode
  ;;                                        magit-blame-mode
  ;;                                        magit-key-mode
  ;;                                        magit-status-mode)
  ;;                                      evil-emacs-state-modes)

  ;;       evil-insert-state-modes (append '(org-capture-mode
  ;;                                         global-git-commit-mode
  ;;                                         git-commit-mode
  ;;                                         inferior-ess-mode)
  ;;                                       evil-insert-state-modes))

  (setq evil-move-cursor-back nil)

  (use-package anaconda-mode
    :config
    ;; (setq company-backends (cons 'company-anaconda company-backends))
    ;; (bind-key "<C-tab>" 'complete-symbol anaconda-mode-map)
    ;; (spacemacs/helm-gtags-define-keys-for-mode 'anaconda-mode)
    ;; (add-hook-progn 'anaconda-mode-view-mode-hook
    ;;                 (evil-emacs-state))


    )

  (use-package evil
	  :config
	  (setq evil-toggle-key "C-`"
		      evil-want-C-i-jump nil
		      evil-want-C-u-scroll nil
          evil-want-Y-yank-to-eol nil)

	  (let ((estate-modes '(term-mode
						              org-brain-visualize-mode
						              anaconda-mode-view-mode
						              ;; elfeed-search-mode
						              ;; elfeed-show-mode
						              epa-key-list-mode
						              git-rebase-mode
						              magit-popup-mode
						              magit-blame-mode
						              magit-key-mode
						              magit-status-mode))
		      (istate-modes '(org-capture-mode
						              global-git-commit-mode
						              git-commit-mode
						              inferior-ess-mode)))

	    (dolist (mode estate-modes)
		    (evil-set-initial-state mode 'emacs))
	    (dolist (mode istate-modes)
		    (evil-set-initial-state mode 'insert))))

  (use-package evil-org
    :init
    (require 'evil-org)
    (unbind-key "M-l" evil-org-mode-map)
    (unbind-key "<insert-state> M-l" evil-org-mode-map)
    (unbind-key "<normal-state> M-l" evil-org-mode-map))

  (use-package evil-rsi
    :diminish evil-rsi-mode
    :config
    (evil-rsi-mode)
    ;; evil-rsi "helpfully" rebinds C-h in insert-mode -- THE HELP COMMAND --
    ;; without warning anyone.
    (unbind-key "<insert-state> C-h" evil-rsi-mode-map))

  (use-package evil-surround
    :demand t
    :config (global-evil-surround-mode 1))

  (use-package expand-region
    :bind ("C-=" . er/expand-region))

  (use-package flycheck
    ;; :config (global-flycheck-mode 1)
    )

  (use-package flycheck-rust
    :defer t
    :init (add-hook 'rust-mode-hook 'flycheck-rust-setup))

  (use-package flylisp
    :defer t
    :commands flylisp-mode
    :init (progn
            (defun enable-flylisp-mode ( )
              (interactive)
              (flylisp-mode 1))

            (add-hook 'emacs-lisp-mode-hook 'enable-flylisp-mode)
            (add-hook 'lisp-mode-hook 'enable-flylisp-mode)))
  (use-package flyspell
    :diminish flyspell-mode
    :commands (flyspell-mode flyspell-prog-mode)
    :init (progn
            (add-hook 'text-mode-hook 'flyspell-mode)
            (add-hook 'prog-mode-hook 'flyspell-prog-mode)))
  (use-package function-args :defer t)
  ;; (git-blame :defer t)
  (use-package git-commit
    :demand t
    :config (global-git-commit-mode 1))
  ;; (git-modeline
  ;;  :config (setq git-state-modeline-decoration 'git-state-decoration-letter))
  ;; (use-package git-rebase :defer t)
  ;; (use-package gitconfig-mode :defer t)
  ;; (use-package gitignore-mode :defer t)

  ;; (use-package ggtags
  ;;   :bind ("M-r" . ggtags-query-replace))
  (use-package julia-mode
    :defer t
    :commands julia-mode
    :mode "\\.jl\\'")
  (use-package haskell-mode
    :defer t
    :mode "\\.hs\\'"
    :init (progn
            (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)))

  (setq helm-google-suggest-use-curl-p t)

  (use-package helm-company
    :bind ("<C-tab>" . helm-company)
    :init
    (progn
      (setq
       helm-company-initialize-pattern-with-prefix :downcase)))

  ;; (use-package helm-gtags
  ;;   :demand t
  ;;   :init
  ;;   (progn
  ;;     (defun helm-gtags-update-tags-quietly ()
  ;;       (flet ((message (&rest _) nil))
  ;;         (helm-gtags-update-tags)))

  ;;     (define-minor-mode helm-gtags-auto-update-mode
  ;;       "Auto update GTAGS when a file in this mode is saved."
  ;;       :init-value nil
  ;;       :group 'helm-gtags-update
  ;;       (if helm-gtags-auto-update-mode
  ;;           (progn
  ;;             (add-hook 'after-save-hook 'helm-gtags-update-tags-quietly nil :local))
  ;;         (remove-hook 'after-save-hook 'helm-gtags-update-tags-quietly t)))

  ;;     (defun enable-helm-gtags-auto-update-mode()
  ;;       "Turn on `helm-gtags-auto-update-mode'."
  ;;       (interactive)
  ;;       (helm-gtags-auto-update-mode 1))

  ;;     (add-hook 'dired-mode-hook 'helm-gtags-mode)
  ;;     (add-hook 'prog-mode-hook 'helm-gtags-mode)
  ;;     (add-hook 'prog-mode-hook 'enable-helm-gtags-auto-update-mode))

  ;;   :config
  ;;   (progn
  ;;     (require 'ggtags)

  ;;     (setq
  ;;      helm-gtags-ignore-case t
  ;;      helm-gtags-auto-update t
  ;;      helm-gtags-use-input-at-cursor t
  ;;      helm-gtags-pulse-at-cursor t
  ;;      helm-gtags-suggested-key-mapping t)))

  (bind-key "M-?" 'helm-gtags-find-pattern)

  ;; Don't jump to other directory when finding new file.
  (setq ido-auto-merge-work-directories-length -1)

  (setq
   ;; projectile-find-file-hook (lambda () (projectile-invalidate-cache nil))
   projectile-find-file-hook nil
   projectile-enable-caching t
   projectile-completion-system 'helm
   projectile-find-dir-includes-top-level t
   projectile-switch-project-action 'projectile-dired)

  (when (eq system-type 'cygwin)
    (setq projectile-indexing-method 'native))

  ;; Rebind this, because the helm version doesn't work
  ;; outside of project dirs.
  (evil-leader/set-key "p F" 'projectile-find-file-in-known-projects)


  (use-package lisp-mode
	  :config
	  (add-hook-progn
	   'lisp-mode-hook

	   (setq-local indent-tabs-mode nil)))

  (use-package json-mode
    :config
    (add-hook-progn
     'json-mode-hook

     (flymake-json-load)
     (flymake-mode-on)
     (flycheck-mode)))

  (bind-key "C-z m a" 'magit-commit-amend)
  (setq magit-status-buffer-switch-function 'switch-to-buffer)

  (use-package markdown-mode
    :defer t
    :mode "\\.md\\'"
    :config (progn
              (require 'markdown-mode+)
              (setq markdown-enable-math t) ; LaTeX math
              ;; Electric-indent buggers indentation up in markdown-mode
              (add-hook 'electric-indent-functions
                        (lambda (_unused) 'no-indent) nil 'local)))
  (use-package nxml
    :defer t
    :mode "\\.xml'"
    :config (setq nxml-child-indent 2))

  (use-package org-caldav
    :init
    (progn
      (spacemacs/set-leader-keys "aoS" #'org-caldav-sync)
      (add-hook-progn 'org-mode-hook (require 'org-caldav))))

  (use-package helm-org
    :init
    (progn
      (spacemacs/set-leader-keys "aoj" 'helm-org-agenda-files-headings)
      (setq
       helm-org-show-filename t)))

  (use-package helm-org-rifle
    :init
    (progn
      (spacemacs/set-leader-keys "aor" 'helm-org-rifle-agenda-files)
      (setq helm-org-rifle-show-path t)))

  ;; General Org Export Config
  (use-package ox
    :init
    (progn
      (setq
       org-export-creator-info nil
       org-export-with-sub-superscripts t
       org-export-with-tags nil
       ;; ;; When exporting to ODT, convert it to a PDF, too
       ;; org-export-odt-preferred-output-format "pdf"
       )

      (add-to-list 'org-latex-classes
                   '("book-noparts"
                     "\\documentclass{book}"
                     ("\\chapter{%s}" . "\\chapter*{%s}")
                     ("\\section{%s}" . "\\section*{%s}")
                     ("\\subsection{%s}" . "\\subsection*{%s}")
                     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                     ("\\paragraph{%s}" . "\\paragraph*{%s}")
                     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
      ))

  ;; Org LaTeX Export Config
  (use-package ox-latex
    :init

    (progn
      ;; Make UTF8 symbols export properly.
      (setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
      ;; Make math symbols export properly.
      (setq org-latex-default-packages-alist (cons '("mathletters" "ucs" nil) org-latex-default-packages-alist))

      ;; In org LaTeX export, add an empty line between paragraphs (add bigskip)
      ;; where \n\n (double newline) is used.
      (defun my-replace-double-newline (backend)
        "replace multiple blank lines with bigskip"
        (interactive)
        (goto-char (point-min))
        (while (re-search-forward "\\(^\\s-*$\\)\n\n+" nil t)
          (replace-match "\n#+LATEX: \\par\\vspace{\\baselineskip}\\noindent\n" nil t)
          (forward-char 1)))

      (add-hook 'org-export-before-processing-hook 'my-replace-double-newline)

      ;; org-latex-pdf-process '("latexmk -bibtex -pdf %f && latexmk --bibtex -c")
      ;; ;; Remove logfiles after exporting a PDF
      ;; org-export-pdf-remove-logfiles t
      ))

  (use-package org
    :defer t
    :mode ("\\.\\(org\\|org_archive\\)\\'" . org-mode)
    :commands (org-agenda org-iswitchb)
    ;; :bind (("C-z C-o ]" . outline-next-heading)
    ;;        ("C-z C-o [" . outline-previous-heading)
    ;;        ("C-z C-o a" . org-agenda)
    ;;        ("C-z C-o b" . user/org-iswitchb-agenda)
    ;;        ("C-z C-o j" . org-clock-goto)
    ;;        ("C-z C-o l" . org-store-link)
    ;;        ("C-z C-o o" . org-clock-out)
    ;;        ("C-z C-o <C-right>" . org-demote-subtree)
    ;;        ("C-z C-o <C-left>" . org-promote-subtree))
    ;; :idle (require 'org)
    :init

	  (defun user/org-add-ids-to-file ()
	    (interactive)
      ;; Don't add ids to "orglink"-tagged entries. This is so link-only entries
      ;; don't clutter up org-brain.
	    (org-map-entries 'org-id-get-create "-orglink" 'file))

    (defun user/org-iswitchb-agenda ()
      "call `org-iswitchb' with two prefix args, restricting selection
            to agenda files."
      (interactive)
      (org-iswitchb 14))

    (spacemacs/set-leader-keys
      "aa" 'org-agenda)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode
      "j g" 'org-goto
      "j c" 'org-clock-goto)

    :config

    (defun user/pvlink (ID TEXT)
      "Make a link for propview"
      (s-join "" (list "[[id:" ID "][" ITEM "]]")))

    (defmacro widen-and-maybe-renarrow (&rest body)
      `(let ((_was-narrowed (buffer-narrowed-p)))
         (widen)

         ,@body

         (when _was-narrowed
           (org-narrow-to-subtree)
           (outline-show-subtree))))

    (defun org-goto-and-maybe-renarrow ()
      (interactive)
      (widen-and-maybe-renarrow
       (call-interactively 'org-goto)))

    (defun org-open-at-point-and-maybe-renarrow ()
      (interactive)
      (widen-and-maybe-renarrow
       (org-open-at-point)))

    (bind-key [remap org-open-at-point] 'org-open-at-point-and-maybe-renarrow org-mode-map)

    (add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
    (defun place-agenda-tags ()
      "Put the agenda tags by the right border of the agenda window."
      (setq org-agenda-tags-column (- 2 (window-width)))
      (org-agenda-align-tags))

    (add-hook-progn 'org-mode-hook
                    (flycheck-mode -1))

    ;; For `helm-show-kill-ring'
    (unbind-key "C-y" org-mode-map)

    ;; Default binding for <C-tab> is dumb. I want
    ;; `helm-company', dammit!
    (unbind-key "<C-tab>" org-mode-map)
    (bind-key "<C-M-tab>" #'org-force-cycle-archived org-mode-map)

    (defun org-random-cmp (a b)
      "Return -1,0 or 1 randomly"
      (- (mod (random) 3) 1))

    (setq org-agenda-cmp-user-defined #'org-random-cmp)

    (setq

     user/checklists-agenda
     '(todo "CHECKLIST"
            ((org-agenda-archives-mode nil)
             (org-agenda-overriding-header ":: CHECKLISTS")))

     user/started-agenda
     '(todo "STARTED"
            ((org-agenda-archives-mode nil)
             (org-agenda-overriding-header ":: STARTED - In Progress")
             (org-tags-match-list-sublevels t)))

     user/next-agenda
     '(todo "NEXT"
            ((org-agenda-archives-mode nil)
             (org-agenda-overriding-header ":: NEXT - Near Future")
             (org-tags-match-list-sublevels t)
             (org-agenda-skip-function '(org-agenda-skip-entry-if
                                         'scheduled 'deadline))))

     user/todo-agenda
     '(todo "TODO|QUESTION"
            (
             (org-agenda-archives-mode nil)
             (org-agenda-overriding-header ":: TODO Tasks")
             (org-agenda-skip-function '(org-agenda-skip-entry-if
                                         'scheduled 'deadline))))

     user/verify-agenda
     '(todo "VERIFY"
            ((org-agenda-overriding-header ":: Work to VERIFY")))

     user/hold-agenda
     '(todo "HOLD|BILLING"
            ((org-agenda-overriding-header ":: HOLD - Blocked Tasks")))

     user/refile-agenda
     '(tags "refile-ARCHIVE|unfinished-ARCHIVE"
            ((org-agenda-overriding-header ":: REFILE & Unfinished Notes")
             (org-tags-match-list-sublevels nil)))

     user/future-agenda
     '(todo "FUTURE"
            ((org-agenda-overriding-header ":: FUTURE - TODO, Eventually")
             (org-agenda-todo-ignore-scheduled t)
             (org-agenda-todo-ignore-deadlines t)))

     user/review-agenda
     '(tags "-ARCHIVE-journal/DONE|CANCELLED"
            ((org-agenda-overriding-header ":: DONE - Review"))))

    ;; Make "C-z C-o a <RET>" display an overview of all
    ;; tasks in my agenda files.
    (setq
     org-agenda-custom-commands
     `(("o" "Agenda Tasks"
        (
         (agenda "-drill"
                 ((org-agenda-archives-mode t)
                  (org-agenda-span 7)
                  (org-agenda-overriding-header "== Agenda ==")
                  (org-agenda-start-on-weekday nil)
                  (org-agenda-skip-deadline-if-done t)
                  (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("CHECKLIST")))
                  (org-agenda-cmp-user-defined #'hw-org-agenda-sort-habits)))
         ,user/checklists-agenda
         ,user/started-agenda
         ,user/next-agenda
         ,user/verify-agenda
         ,user/todo-agenda
         ,user/hold-agenda
         ,user/future-agenda
         ,user/review-agenda)
        nil)
       ("k" "Kanban View"
        ((agenda "-drill"
                 ((org-agenda-show-all-dates nil)
                  (org-agenda-span 2)
                  (org-agenda-overriding-header "== Agenda ==")
                  (org-agenda-start-on-weekday nil)
                  (org-agenda-skip-deadline-if-done t)
                  (org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo 'any))
                  (org-agenda-cmp-user-defined #'hw-org-agenda-sort-habits)))
         ,user/checklists-agenda
         ,user/started-agenda
         ,user/next-agenda
         ,user/verify-agenda
         ,user/todo-agenda
         ,user/hold-agenda
         ,user/future-agenda
         ,user/review-agenda)
        nil)
       ("a" "AGENDA" ((agenda "-drill" (
                                        (org-agenda-archives-mode t)
                                        ;; (org-agenda-show-all-dates nil)
                                        ))))
       ("r" "Review" tags "refile-ARCHIVE|unfinished-ARCHIVE|TODO=\\\"DONE\\\"-ARCHIVE|TODO=\\\"VERIFY\\\"-ARCHIVE|TODO=\\\"CANCELLED\\\"-ARCHIVE"
        ((org-agenda-overriding-header "Review: Refile, VERIFY, DONE, & Unfinished Notes")
         (org-tags-match-list-sublevels t))
        nil)
       ("d" "Done & Verify" tags "-ARCHIVE-event/DONE|VERIFY|CANCELLED"
        ((org-agenda-overriding-header "DONE - Review"))
        nil)
       ("v" "Verify" todo "VERIFY"
        ((org-agenda-overriding-header "VERIFY"))
        nil)
       ("c" "Scheduled" tags-todo "-TODO=\"DONE\""
        ((org-agenda-overriding-header "Scheduled, Non-Habit")
         (org-agenda-todo-ignore-scheduled nil)
         (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))))))

    (push "quote" org-protecting-blocks)

    ;; (add-to-list 'org-agenda-log-mode-items 'state)

    (add-hook-progn 'org-agenda-mode-hook
                    ;; (setq org-agenda-archives-mode t)
                    (page-break-lines-mode t))

    ;; From https://emacs.stackexchange.com/questions/32430/how-to-sort-habits-by-priority-in-the-org-agenda-view
    (defun hw-org-agenda-sort-habits (a b)
      "Sort habits first by user priority, then by schedule+deadline+consistency."
      (let ((ha (get-text-property 1 'org-habit-p a))
            (hb (get-text-property 1 'org-habit-p b)))
        (when (and ha hb)
          (let ((pa (org-get-priority a))
                (pb (org-get-priority b)))
            (cond ((> pa pb) +1)
                  ((< pa pb) -1)
                  ((= pa pb) (org-cmp-values a b 'priority)))))))

    (spacemacs/set-leader-keys "aoi" 'org-display-inline-images)
    (setq

     ;; Render special formatting in buffer
     org-startup-indented t
     org-pretty-entities t
     org-pretty-entities-include-sub-superscripts t
     org-use-sub-superscripts '{}
     org-columns-default-format (concat "%12TODO "
                                        "%60ITEM"
                                        "%10MILESTONE"
                                        "%1PRIORITY ")

     org-todo-keyword-faces
     '(
       ("VERIFY" . "burlywood")
       ("QUESTION" . "thistle")
       ;; ("VERIFY" . (:foreground "purple" :weight bold))
       )
     ;; Org Capture
     org-default-notes-file "~/personal/refile.org"
     org-cycle-separator-lines 2

     ;; Org Journal
     org-journal-dir "~/org/journal/"

     ;; Org Archiving
     org-archive-subtree-add-inherited-tags t

     ;; Org Agenda
     org-agenda-block-separator ""
     org-agenda-clockreport-parameter-plist '(:link t :maxlevel 2 :compact t :stepskip0 t :fileskip0 t)
     org-agenda-dim-blocked-tasks nil
     org-agenda-dim-blocked-tasks t
     org-agenda-follow-indirect t
     org-agenda-hide-tags-regexp "^\\(work\\|\\(no\\)?export\\|habit\\|computer\\|nomob\\(ile\\|agenda\\)\\)"
     org-agenda-property-position 'same-line
     org-agenda-remove-tags 'prefix
     org-agenda-skip-additional-timestamps-same-entry nil
     org-agenda-span 'fortnight
     org-agenda-start-on-weekday nil
     org-agenda-start-with-clockreport-mode nil
     org-agenda-start-with-log-mode t
     org-agenda-todo-ignore-scheduled 'future
     org-agenda-window-setup 'same-window
     org-habit-graph-column 44

     org-agenda-sorting-strategy '((agenda timestamp-up user-defined-down timestamp-up)
                                   (todo todo-state-up priority-down timestamp-up)
                                   (tags todo-state-up priority-down timestamp-up)
                                   (search priority-down category-up timestamp-up))

     org-goto-interface 'outline-path-completion
     org-goto-max-level 2
     ;; When prompting for an org-mode path, don't construct the path
     ;; incrementally.
     org-outline-path-complete-in-steps nil
     org-refile-use-outline-path 'file
     ;; When refiling to a parent node that doesn't exist, prompt to
     ;; create it.
     org-refile-allow-creating-parent-nodes 'confirm
     org-completion-use-ido t
     ido-everywhere nil
     ido-max-directory-size 100000

     ;; Tags
     org-tags-exclude-from-inheritance '("PRJ" "SUBPRJ" "unfinished")
     org-tags-column 0

     ;; Priority
     org-lowest-priority 69
     org-default-priority 67

     ;; State Workflow
     org-enforce-todo-dependencies t
     org-enforce-todo-checkbox-dependencies nil

     org-todo-keywords
     '(;; Work Statuses
       (sequence "PREWORK" "TODO(t)" "NEXT(n)" "STARTED(s)" "POSTWORK" "|" "DONE(d!)")
       (sequence "APPT(a)" "FUTURE(f)" "HOLD(h@)" "|" "CANCELLED(c@)" "BILLING(B!)" "PAID(P!)")
       (sequence "CHECKLIST" "|")
       (sequence "QUESTION(Q)" "|" "ANSWER(A)" "CONFIRMED(C)"))

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
     org-log-done nil
     org-log-into-drawer t
     org-time-clocksum-format (list :hours "%d"
                                    :require-hours t
                                    :minutes ":%02d"
                                    :require-minutes t))

    (defun user/org-id+headline-complete ()
      (save-window-excursion
        (let ((item (org-refile-get-location)))
          (find-file (nth 1 item))
          (goto-char (nth 3 item))
          (s-concat "id:" (org-id-get-create)))))

    (org-link-set-parameters
     "id+headline"
     :complete (lambda () (user/org-id+headline-complete))))

  (use-package ascii-art-to-unicode
    :config
    (defun aa2u-buffer ()
      (aa2u (point-min) (point-max))))

  (use-package org-brain
    :ensure t
    :init
    (progn

      (defun org-brain-visualize-at-point ()
        (interactive)
        (org-brain-visualize (org-brain-entry-at-pt)))

      (setq
       org-brain-file-entries-use-title nil
       org-brain-file-entries-use-title nil
       org-brain-headline-links-only-show-visible t
       org-brain-path "~/org/brain"
       org-brain-visualize-default-choices 'all
       org-brain-visualize-one-child-per-line t
       org-brain-visualize-sort-function 'ignore)

      (spacemacs/set-leader-keys "aob" 'org-brain-visualize)
      (spacemacs/set-leader-keys "aop" 'org-brain-visualize-at-point))

    :config
    (setq
     org-id-track-globally t
     org-id-link-to-org-use-id t
     org-brain-visualize-default-choices 'all
     org-brain-title-max-length 35)

    (require 'ascii-art-to-unicode)
    (add-hook 'org-brain-after-visualize-hook #'aa2u-buffer)
	  )

  (use-package org-capture
    :defer 10
    :init
    (add-hook 'org-capture-prepare-finalize-hook 'org-id-get-create))

  (use-package org-drill
    :demand t
    :init
    (progn
      (spacemacs/set-leader-keys "aod" 'org-drill)
      (setq
       org-drill-learn-fraction 0.45
       org-drill-maximum-duration 30
       org-drill-maximum-items-per-session 40)))

  (use-package org-indent
    :requires org-compat
    :init
    (add-hook-progn 'org-mode-hook
                    (org-indent-mode)))

  (use-package org-protocol
    :demand t)

  ;; (org-journal
  ;;  :defer t
  ;;  :require org)
  ;; (org-toc
  ;;  :defer t
  ;;  :require org)
  (use-package outline-mode
    :defer t
    :config (progn
              (bind-key "<C-down>" 'outline-next-visible-heading outline-minor-mode-map)
              (bind-key "<C-up>" 'outline-previous-visible-heading outline-minor-mode-map)
              (bind-key "<M-down>" 'outline-move-subtree-down outline-minor-mode-map)
              (bind-key "<M-up>" 'outline-move-subtree-up outline-minor-mode-map)
              (bind-key "<M-left>" 'outline-promote outline-minor-mode-map)
              (bind-key "<M-right>" 'outline-demote outline-minor-mode-map)
              (bind-key "<C-M-tab>" 'outline-cycle outline-minor-mode-map)))
  (use-package pylint
    :defer t
    :commands pylint
    :config (progn
              (setq
               pylint-command "pylint"
               pylint-options '("-E" "--reports=n" "--output-format=parseable"))))
  (use-package scala-mode
    :defer t
    :mode "\\.scala\\'"
    :config (scala-mode-feature-electric-mode))
  (use-package slime
    :defer t
    :commands slime
    :init (setq inferior-lisp-program "/usr/bin/sbcl")
    :config (progn
              (slime-setup (cons 'slime-company slime-contribs))
              ;; Key bindings
              (bind-key "RET" 'newline-and-indent slime-mode-map)))
  (use-package term
    ;; :bind ("C-z t" . user/ansi-term)
    :init (progn
            (defun user/ansi-term ()
              (interactive)
              (ansi-term "/bin/bash" "shell"))

            (defun user/term-send-prev-word ()
              (interactive)
              (term-send-raw-string "\eb"))

            (defun user/term-send-next-word ()
              (interactive)
              (term-send-raw-string "\ef")))
    :config (progn
              (bind-key "C-z" 'term-stop-subjob term-raw-escape-map)
              (bind-key "<C-left>" 'user/term-send-prev-word term-raw-map)
              (bind-key "<C-right>" 'user/term-send-next-word term-raw-map)

              (add-hook-progn 'term-mode-hook (evil-local-mode -1))
              ;; TODO: make a term-exit-hook instead
              (defadvice term-handle-exit
                  (after bind-q-to-kill-dead-term activate)
                (read-only-mode)
                (local-set-key (kbd "q") 'kill-buffer-and-window))

              ;; Terminals in emacs should be able to run tmux, regardless of
              ;; whether or not emacs was started within tmux.
              (setenv "TMUX" "")))
  (use-package term-run
    :init
    (evil-leader/set-key "M-!" 'term-run-shell-command))
  (use-package tidy
    :defer t
    :commands tidy-buffer
    ;; Tell the tidy command to tidy up XML files; by default,
    ;; it complains about XML being "malformed HTML".
    :config (setq tidy-shell-command "/usr/bin/tidy -xml"))

  ;; Theoretically, make TRAMP handle /sudo:root@host: paths by logging
  ;; in via the regular TRAMP ssh method, and then `sudo` to root.
  (setq tramp-default-proxies-alist '(((regexp-quote (system-name)) nil nil)
                                      (nil "\\`root\\'" "/ssh:%h:")))

  (use-package undo-tree
    :diminish undo-tree-mode
    :config
    (setq undo-tree-visualizer-diff nil)
    (global-undo-tree-mode 1))
  ;; (unicode-fonts
  ;;  :require persistent-soft

  ;;  :init
  ;;  (defun my-hook-unicode-fonts-setup (frame)
  ;;    "Run unicode-fonts-setup, then remove the hook."
  ;;    (progn
  ;;      (select-frame frame)
  ;;      (unicode-fonts-setup)
  ;;      (message "Removing unicode-fonts-setup to after-make-frame-functions hook")
  ;;      (remove-hook 'after-make-frame-functions 'my-hook-unicode-fonts-setup)))
  ;;                                       ;(add-hook 'after-make-frame-functions 'my-hook-unicode-fonts-setup nil)

  ;;  :config
  ;;  (require 'persistent-soft))

  (setq vc-follow-symlinks t)

  ;; (web-mode
  ;;  :defer t
  ;;  :mode "\\.\\(p?html?\\|tpl\\|php\\|jsp\\|as[cp]x\\|erb\\)\\'"
  ;;  :config (setq web-mode-disable-auto-pairing nil))
  ;; (window-jump
  ;;  :bind (("C-z <C-down>" . window-jump-down)
  ;;         ("C-z <down>" . window-jump-down)
  ;;         ("C-z <C-up>" . window-jump-up)
  ;;         ("C-z <up>" . window-jump-up)
  ;;         ("C-z <C-left>" . window-jump-left)
  ;;         ("C-z <left>" . window-jump-left)
  ;;         ("C-z <C-right>" . window-jump-right)
  ;;         ("C-z <right>" . window-jump-right)))
  (use-package ws-butler
    :diminish (ws-butler-mode)
    ;; ws-butler breaks emacs if it's run before the emacs window
    ;; starts.
    :init (add-hook 'window-setup-hook 'ws-butler-global-mode))
  (use-package xt-mouse
    :if (not window-system)
    :defer t
    :init (xterm-mouse-mode t))
  (use-package zenburn-theme
    :config
    (set-face-background 'region "dark slate gray"))

  ;; (set-face-attribute 'default t :height 140)
  ;; (set-face-attribute 'default nil :height 140)

  ;; For Time Sheets
  (defun tbl-total-hours-to-money(wage original-string)
    (let* ((without-asterisks (replace-regexp-in-string
                               "\*" "" original-string))
           (hours (destructuring-bind (hours-str minutes-str)
                      (split-string without-asterisks ":")
                    (+ (string-to-number hours-str)
                       (/ (string-to-number minutes-str) 60.0)))))
      (format "$%.2d" (* hours wage))))

  ;; I want to start with an ielm buffer open
  (save-window-excursion
    (ielm))

  ;; ;; TEMP:
  ;; (load "~/prj/emacs/anki-editor/anki-editor.el")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
