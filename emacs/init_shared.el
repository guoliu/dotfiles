(load "~/repo/dotfiles/emacs/custom_commands.el")
(load "~/repo/dotfiles/emacs/auctex_related.el")
(load "~/repo/dotfiles/emacs/package_list.el")

(desktop-save-mode 0)

;; (pdf-tools-install)

(setq dired-listing-switches "-alh")
(add-hook 'dired-mode-hook 'auto-revert-mode)

;;(auto-package-update-maybe)
;;(auto-package-update-at-time "08:00")
;;(setq auto-package-update-interval 1)
;;(setq auto-package-update-delete-old-versions t)

;;(add-hook 'auto-package-update-before-hook
;;          (lambda () (message "I will update packages now")))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; (use-package restclient
;;   :mode ("\\.http\\'" . restclient-mode))


(setq emerge-diff-options "--ignore-all-space")

;;(global-auto-complete-mode t)
(require 'auto-complete)
(define-global-minor-mode my-global-auto-complete-mode auto-complete-mode
  (lambda ()
    (when (not (memq major-mode
		     (list 'scala-mode 'sbt-mode 'shell)))
      (auto-complete-mode))))
(my-global-auto-complete-mode 1)


(add-hook 'compilation-filter-hook
          'comint-truncate-buffer)
(setq comint-buffer-maximum-size 1000)


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)



(global-visual-line-mode 1); Proper line wrapping
(global-hl-line-mode 0); Highlight current row
(show-paren-mode 1); Matches parentheses and such in every mode

;; (setq visible-bell t); Flashes on error

(add-to-list 'default-frame-alist '(height . 59)); Default frame height.


(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%d ")



(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

(yas-global-mode 1)

(when (fboundp 'winner-mode)
  (winner-mode 1))


(setq js-indent-level 2)
