;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;(setq user-full-name "John Doe"
;;      user-mail-address "john.doe@aol.com")

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
(setq doom-font (font-spec :family "monospace" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(setq doom-theme 'doom-vibrant)
(setq doom-themes-enable-italic nil)
(setq doom-vibrant-brighter-modeline t)
(setq doom-vibrant-brighter-comments t)
(setq doom-vibrant-comment-bg nil)
(custom-theme-set-faces! 'doom-vibrant
  '(fringe :foreground "teal"))  ;; can't see fringe

;;(setq doom-theme 'doom-material)
;;(setq doom-theme 'doom-monokai-pro)
;;(setq doom-theme 'doom-oceanic-next)
;;(setq doom-theme 'doom-solarized-dark)
;;(setq doom-theme 'doom-sourcerer)
;;(setq doom-theme 'doom-spacegrey)
;;(setq doom-theme 'doom-tomorrow-night)
;;(load-theme 'deeper-blue t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/GTD/")
(setq org-default-notes-file (concat org-directory "/Actions/notes.org"))
(setq org-agenda-files (quote ("~/GTD/Actions/")))
(setq org-roam-directory "~/GTD/RoamNotes")
(setq org-roam-db-location "~/GTD/RoamNotes/org-roam-perso.db")
(setq org-default-priority ?D)
(setq org-agenda-custom-commands
      '(
        ("eP" "Eisenhower matrix Personnel"
         ((tags-todo
           "+PRIORITY=\"A\""
           ((org-agenda-overriding-header "Urgent and important")(org-agenda-files '("~/GTD/Actions/Personnel.org"))))
          (tags-todo
           "+PRIORITY=\"B\""
           ((org-agenda-overriding-header "Urgent but not important")(org-agenda-files '("~/GTD/Actions/Personnel.org"))))
          (tags-todo
           "+PRIORITY=\"C\""
           ((org-agenda-overriding-header "Important but not urgent")(org-agenda-files '("~/GTD/Actions/Personnel.org"))))
          )nil)
        ("eT" "Eisenhower matrix TAF"
         ((tags-todo
           "+PRIORITY=\"A\"-TagPersonnel"
           ((org-agenda-overriding-header "Urgent and important")))
          (tags-todo
           "+PRIORITY=\"B\"-TagPersonnel"
           ((org-agenda-overriding-header "Urgent but not important")))
          (tags-todo
           "+PRIORITY=\"C\"-TagPersonnel"
           ((org-agenda-overriding-header "Important but not urgent")))
          )nil)
        ("eA" "Eisenhower matrix All"
         ((tags-todo
           "+PRIORITY=\"A\""
           ((org-agenda-overriding-header "Urgent and important")))
          (tags-todo
           "+PRIORITY=\"B\""
           ((org-agenda-overriding-header "Urgent but not important")))
          (tags-todo
           "+PRIORITY=\"C\""
           ((org-agenda-overriding-header "Important but not urgent")))
          )nil)
        ("PX" "XGZ"
         (
          (tags-todo "@XGZ+PRIORITY=\"A\"")
          (tags-todo "@XGZ+PRIORITY=\"B\"")
          (tags-todo "@XGZ+PRIORITY=\"C\"+SCHEDULED<=\"<+2d>\"")
          (tags-todo "@XGZ+PRIORITY=\"D\"+SCHEDULED<=\"<+2d>\"")
          )
         )
        ("PS" "SLE"
         (
          (tags-todo "@SLE+PRIORITY=\"A\"")
          (tags-todo "@SLE+PRIORITY=\"B\"")
          (tags-todo "@SLE+PRIORITY=\"C\"+SCHEDULED<=\"<+2d>\"")
          (tags-todo "@SLE+PRIORITY=\"D\"+SCHEDULED<=\"<+2d>\"")
          )
         )
        ("PH" "HJL"
         (
          (tags-todo "@HJL+PRIORITY=\"A\"")
          (tags-todo "@HJL+PRIORITY=\"B\"")
          (tags-todo "@HJL+PRIORITY=\"C\"+SCHEDULED<=\"<+2d>\"")
          (tags-todo "@HJL+PRIORITY=\"D\"+SCHEDULED<=\"<+2d>\"")
          )
         )
        ("PC" "CSN"
         (
          (tags-todo "@CSN+PRIORITY=\"A\"")
          (tags-todo "@CSN+PRIORITY=\"B\"")
          (tags-todo "@CSN+PRIORITY=\"C\"+SCHEDULED<=\"<+2d>\"")
          (tags-todo "@CSN+PRIORITY=\"D\"+SCHEDULED<=\"<+2d>\"")
          )
         )
        ("PN" "NSF"
         (
          (tags-todo "@NSF+PRIORITY=\"A\"")
          (tags-todo "@NSF+PRIORITY=\"B\"")
          (tags-todo "@NSF+PRIORITY=\"C\"+SCHEDULED<=\"<+2d>\"")
          (tags-todo "@NSF+PRIORITY=\"D\"+SCHEDULED<=\"<+2d>\"")
          )
         )
        ("PA" "AgnieszkaJANKOWSKI"
         (
          (tags-todo "@AgnieszkaJANKOWSKI+PRIORITY=\"A\"")
          (tags-todo "@AgnieszkaJANKOWSKI+PRIORITY=\"B\"")
          (tags-todo "@AgnieszkaJANKOWSKI+PRIORITY=\"C\"+SCHEDULED<=\"<+2d>\"")
          (tags-todo "@AgnieszkaJANKOWSKI+PRIORITY=\"D\"+SCHEDULED<=\"<+2d>\"")
          )
         )
        )
      )

(defun test (person)
  (interactive "sPerson:")
  (select-frame-set-input-focus (make-frame))
  (find-file person)
  (split-window-below)
  (org-agenda nil (format "P%s" person))
  (split-window-horizontally)
  (find-file "~/GTD/Actions/RDV.org")
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; vanilla line wrap mode
(setq-default truncate-lines nil
              word-wrap nil)

;; vanilla fringe, we want to see the fringe!
(after! git-gutter-fringe (fringe-mode nil))

;; turn auto-save back on...
(setq auto-save-default t)

;; blinky back on
(blink-cursor-mode 1)

;; alter company mode delay
;;(after! company
;;  (setq company-idle-delay 0.1))

;; disable lsp doc
;;(setq lsp-ui-doc-enable nil)

;; disable company mode in shell
(add-hook 'shell-mode-hook (lambda ()
                             (company-mode -1)))

;; use hunspell
(if (file-exists-p "/usr/bin/hunspell")
    (progn
      (setq ispell-program-name "hunspell")
      (setq ispell-dictionary "american"
            ispell-extra-args '("-a" "-i" "utf-8" "-d" "en_US")
            ispell-silently-savep t
            )))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; auto reverts files when changed on disk
(global-auto-revert-mode)
(auto-revert-mode)

(setq ag-highlight-search t)

;; ido support  -- i'm still on the fence ido vs ivy
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (setq ido-create-new-buffer 'always)
;; (setq confirm-kill-emacs nil)

;;; Michael's Preferences                  *** -------------------------------
(setq kill-whole-line t)                   ;;; Killing line also deletes \n
(setq next-line-add-newlines nil)          ;;; Down arrow won't add \n at end
(setq require-final-newline t)             ;;; Put \n at end of last line
(setq make-backup-files t)               ;;; Don't make backup files
(setq line-number-mode t)                  ;;; Put line number in display
(setq default-major-mode 'text-mode)       ;;; New buffers are text mode
;(setq fill-column 80)                      ;;; Text lines limit to 80 chars
;(add-hook 'text-mode-hook 'turn-on-auto-fill); Line limit on in text mode
                                           ;;; -------------------------------

