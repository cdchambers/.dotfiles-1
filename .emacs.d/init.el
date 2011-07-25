;;; DOT EMACS
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;;; SET STUFF
(setq custom-file "~/.emacs.d/custom.el"
      bkup-backup-directory-info '((t "~/.emackups" ok-create full-path prepend-name))
      inferior-lisp-program "clisp -K full"
      tramp-default-method "ssh"
      ido-enable-flex-matching t
      org-agenda-files (list "~/org/todo.org")
      org-log-done t
      multi-term-program "/bin/zsh"
      require-trailing-newline t
      x-select-enable-clipboard t
      inhibit-startup-message t
      backup-directory-alist '(("." . "~/.emacs.d/.backups"))
      echo-keystrokes 0.1
      next-line-add-newlines nil
      recentf-max-saved-items 50
      column-number-mode t
      ido-max-directory-size 100000
      magit-completing-read 'ido-completing-read
      font-lock-maximum-decoration t)
(setq-default kill-read-only-ok t)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; LOAD PATH
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; LOAD
(load "smartscan.el")
(load "mpd.el")
(load "feature-mode/feature-mode.el")
(load "my-functions.el")
(load "rinari/rinari.el")
(load "mine/hooks.el")
(load custom-file 'noerror)
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(autoload 'js2-mode "js2-mode" nil t)
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(autoload 'idomenu "idomenu" nil t)
(autoload 'comint-dynamic-complete-filename "comint" nil t)

;;; REQUIRE
(require 'slime)
(require 'smex)
(require 'ido)
(require 'autopair)
(require 'recentf)
(require 'highline)
(require 'rinari)
(require 'regex-tool)
(require 'find-file-in-git-repo)
(require 'backup-dir)

;; (require 'auto-complete)
;; (setq ac-sources '(ac-source-symbols
;;                     ac-source-abbrev
;;                     ac-source-filename
;;                     ac-source-imenu
;;                     ac-source-words-in-all-buffer
;;                     ac-source-words-in-same-mode-buffers))
;;(require 'moccur-color)
;;(require 'moccur-edit)
;;(require 'elscreen)
;;(require 'paren)
;;(require 'smarttabs)
;;(require 'yasnippet)

;;; CALL STUFF
(smex-initialize)
(ido-mode t)
(transient-mark-mode t)
(go-to-hell-bars)
(recentf-mode t)
(show-paren-mode t)
(highline-mode)
(auto-compression-mode 1) ; Lets emacs uncompress .gz files before opening them
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/snippets")

;;; AUTO-MODE
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode)) ;; turn on css-mode for sass
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode)) ;; turn on ruby-mode for rakefiles

;;; KEYBINDINGS
(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(global-set-key (kbd "M-i") 'idomenu)
(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "M-#") 'uncomment-region)
(global-set-key (kbd "M-l")  'next-multiframe-window)
(global-set-key (kbd "M-h") 'previous-multiframe-window)
(global-set-key (kbd "C-c r") 'rgrep)
(global-set-key (kbd "C-c d") 'make-directory)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c f") 'flyspell-correct-word-before-point)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)
(global-set-key (kbd "C-c b") 'moccur)
(global-set-key (kbd "C-c m p") 'mpc-play-dir)
(global-set-key (kbd "C-c m q") 'mpc-queue-dir)
(global-set-key (kbd "C-c m c") 'mpc-clear-playlist)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-c C-a") 'beginning-of-line)
(global-set-key (kbd "C-k") 'could-eat-a-horse-kill)
(global-set-key (kbd "C-c C-k") 'could-eat-a-horse-kill-whole-line)
(global-set-key (kbd "C-y") 'yank-and-indent)
(global-set-key (kbd "C-S-p") 'clone-line-up)
(global-set-key (kbd "C-S-n") 'clone-line-down)
(global-set-key (kbd "C-,") 'indent-buffer)
(global-set-key (kbd "M-s s") 'replace-string)
(global-set-key (kbd "M-s S") 'replace-regexp)
(global-set-key (kbd "C-c C-e") 'eshell)
(global-set-key (kbd "C-c C-d") 'c-hungry-delete-forward)
(global-set-key (kbd "C-c <backspace>") 'c-hungry-delete-backwards)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "C-x M-f") 'find-file-in-git-repo)
(global-set-key (kbd "C-c i f") 'insert-file-name)
(global-set-key (kbd "C-c i d") 'insert-dir-name)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-?") 'comint-dynamic-complete-filename)
(global-set-key (kbd "C-c e") 'flymake-goto-next-error-and-show)
(global-set-key (kbd "C-x :") 'execute-extended-command)
(global-set-key (kbd "C-c M-v") 'scroll-other-window-down)
(global-set-key (kbd "C-c C-v") 'scroll-other-window)
(global-set-key (kbd "C-o") 'loccur-current)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-x M-f") 'find-file-in-git-repo)
(global-set-key (kbd "C-x K") 'kill-focused-buffer)
(global-set-key (kbd "C-x f") 'toggle-full-window)

;; wtf am i doing
(define-key key-translation-map "\C-j" "\C-x")
