;;; package --- Summary
;;; Commentary:
;; This must be done here, as package initialization happens before my
;; personal configuration takes place.
;;; Code:
(setq gc-cons-threshold most-positive-fixnum)

;; set up packaging
(require 'package)
(setq package-enable-at-startup nil)

;; make sure to reload and compile .el if newer than .elc
(setq load-prefer-newer t)
;;; early-init.el ends here
