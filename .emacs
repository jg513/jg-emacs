
;; Copyright (C) Jin Gan <jg_513@163.com>

(defconst home (file-name-directory load-file-name))

(progn
  (add-to-list 'load-path (concat home ""))
  (add-to-list 'load-path (concat home "auto-complete"))
  (add-to-list 'load-path (concat home "erlang"))
  (add-to-list 'load-path (concat home "popup"))
  (add-to-list 'load-path (concat home "sr-speedbar"))
  (add-to-list 'load-path (concat home "switch-window"))
  (add-to-list 'load-path (concat home "yasnippet"))
  )

(progn
  (require 'auto-complete-config)
  (require 'erlang-flymake)
  (require 'erlang-start)
  (require 'gtags)
  (require 'libmisc)
  (require 'popup)
  (require 'sr-speedbar)
  (require 'switch-window)
  (require 'yasnippet)
  )

(progn
  (fset 'yes-or-no-p 'y-or-n-p)

  (add-to-list 'ac-dictionary-directories
			   "/home/jg/jg-emacs/auto-complete/dict")
  (ac-config-default)
  (add-to-list 'ac-modes 'erlang-mode)
  )

(progn
  (setq erlang-root-dir "/usr/local/erlang/lib/erlang")
  (add-to-list 'exec-path "/usr/local/erlang/lib/erlang/bin")
  )

(progn
  (global-set-key (kbd "C-;") 'comment-dwim)
  (global-set-key (kbd "C-h c") 'customize)
  (global-set-key (kbd "C-i") 'indent-dwim)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "C-x k") 'kill-this-buffer)
  (global-set-key (kbd "C-x o") 'switch-window)
  (global-set-key (kbd "C-x w") 'kill-buffer-and-window)
  (global-set-key (kbd "M-;") 'comment-dwim)
  (global-set-key (kbd "TAB") 'self-insert-command)
  (global-set-key [f8] 'switch-window)
  (global-set-key [f9] 'switch-recent-buffer)

  (add-hook 'ibuffer-mode-hook
			(lambda ()
			  (define-key ibuffer-mode-map (kbd "C-x C-f") 'ido-find-file)))

  (add-hook 'yas-minor-mode-hook
			(lambda ()
			  (define-key snippet-mode-map (kbd "TAB") 'self-insert-command)))

  (add-hook 'yas-minor-mode-hook
			(lambda ()
			  (define-key snippet-mode-map (kbd "TAB") 'self-insert-command)))
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.1)
 '(ac-auto-start 1)
 '(ac-candidate-menu-min 0)
 '(ac-use-menu-map t)
 '(auto-save-default nil)
 '(before-save-hook (quote (delete-trailing-whitespace)))
 '(c-basic-offset 4)
 '(c-default-style
   (quote
	((c-mode . "K&R")
	 (java-mode . "java")
	 (awk-mode . "awk")
	 (other . "gnu"))))
 '(c-tab-always-indent (quote other))
 '(column-number-mode t)
 '(echo-keystrokes 0.01)
 '(flymake-no-changes-timeout 2)
 '(global-auto-complete-mode t)
 '(global-linum-mode t)
 '(help-window-select t)
 '(ido-auto-merge-delay-time 1.5)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(scroll-conservatively 1)
 '(scroll-margin 3)
 '(scroll-preserve-screen-position 1)
 '(size-indication-mode t)
 '(tab-always-indent nil)
 '(tab-width 4)
 '(yas-global-mode t nil (yasnippet)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
