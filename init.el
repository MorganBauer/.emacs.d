;;; init.el --- Summary
;;; Commentary:

;;; Code:
;; set this as early as possible to take effect
;; (setq debug-on-error 't)

;; be super explicit about what package archives we want
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/") ;; https instead of default http
        ("nongnu" . "https://elpa.nongnu.org/nongnu/") ;; because of course non-gnu stuff has to be separated
	("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/"))
      package-archive-priorities ;; otherwise everything has the same 0 priority
      '(("gnu" . 5)
        ("nongnu" . 4)
        ("melpa-stable" . 2)
        ("melpa". 3)))

(package-initialize)
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key) ;; for using :bind in use-package declarations

;; Install packages automatically.
(setq use-package-always-ensure t)

;; Load everything if running as a daemon.
(if (daemonp)
    (setq use-package-always-demand t))

;; not sure if I use this, but is used to rename modes in the modeline
(use-package delight
  :ensure t)

;; load the real init file after everything else
;; TODO: investigate  (setq package-enable-at-startup nil)
(defconst mhb-home-emacs-directory (expand-file-name  "mhb.org" user-emacs-directory) "Home directory Emacs location.")

(org-babel-load-file mhb-home-emacs-directory 'compile)

;; We should be started up and all of personal configuration is loaded.

;; set gc back to a more reasonable value (?) approximately 50megs.
(setq gc-cons-threshold (* 50 1000 1000))
;;; init.el ends here
