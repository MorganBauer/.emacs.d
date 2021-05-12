;;; init.el --- Summary
;;; Commentary:

;;; Code:
;; set this as early as possible to take effect
;; (setq debug-on-error 't)

;; something involving performance on startup. approximately 500megs
(setq gc-cons-threshold (* 500 1000 1000))
;;
(setq load-prefer-newer t)

;; load the real init file after everything else
;; TODO: investigate  (setq package-enable-at-startup nil)
(defconst mhb-home-emacs-directory (expand-file-name  "~/.emacs.d/mhb.org") "Home directory Emacs location.")
(defconst mhb-sync-emacs-directory-unix (expand-file-name "~/sync/org-notes/mhb.org") "Synced Emacs config on unix systems.")
(defconst mhb-sync-emacs-directory-windows (expand-file-name "appdatalocalroamingwhatever") "Synced Emacs config on windows systems.")

(cond ((file-exists-p mhb-sync-emacs-directory-unix)
       (org-babel-load-file mhb-sync-emacs-directory-unix))
      ((file-exists-p mhb-sync-emacs-directory-windows)
       (org-babel-load-file mhb-sync-emacs-directory-windows))
      ((org-babel-load-file mhb-home-emacs-directory)))

;; We should be started up and all of personal configuration is loaded.

;; set gc back to a more reasonable value (?) approximately 50megs.
(setq gc-cons-threshold (* 50 1000 1000))
;;; init.el ends here
