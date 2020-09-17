;;; init.el --- Summary
;;; Commentary:

;;; Code:
;; set this as early as possible to take effect
(setq debug-on-error 't)

(setq load-prefer-newer t)

;; load the real init file after everything else
;; TODO: investigate  (setq package-enable-at-startup nil)
(defconst mhb-home-emacs-directory (expand-file-name  "~/.emacs.d/mhb.org") "Home directory Emacs location.")
(defconst mhb-sync-emacs-directory-unix (expand-file-name "~/sync/org-notes/mhb.org") "Synced Emacs config on unix systems.")
(defconst mhb-sync-emacs-directory-windows (expand-file-name "appdatalocalroamingwhatever") "Synced Emacs config on windows systems.")
(add-hook 'after-init-hook
          (lambda ()
            (cond ((file-exists-p mhb-sync-emacs-directory-unix)
                   (org-babel-load-file mhb-sync-emacs-directory-unix))
                  ((file-exists-p mhb-sync-emacs-directory-windows)
                   (org-babel-load-file mhb-sync-emacs-directory-windows))
                  ((org-babel-load-file mhb-home-emacs-directory)))))

;; ELPA server setup
(require 'package)

;; be super explicit about what package archives we want
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/") ;; https instead of default http
                         ("org" . "https://orgmode.org/elpa/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;;; init.el ends here
