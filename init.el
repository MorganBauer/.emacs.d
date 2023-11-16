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
(defconst mhb-home-emacs-directory (expand-file-name  "mhb.org" user-emacs-directory) "Home directory Emacs location.")

(org-babel-load-file mhb-home-emacs-directory 'compile)

;; We should be started up and all of personal configuration is loaded.

;; set gc back to a more reasonable value (?) approximately 50megs.
(setq gc-cons-threshold (* 50 1000 1000))
;;; init.el ends here
