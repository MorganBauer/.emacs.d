;;;; Time-stamp: <2019-01-07 12:06:48 PST (mhb)>

;; set this as early as possible to take effect
;; (setq debug-on-error 't)

(setq load-prefer-newer t)

;; load the real init file after everything else
;; investigate  (setq package-enable-at-startup nil)
(add-hook 'after-init-hook
          (lambda () (org-babel-load-file "~/.emacs.d/mhb.org")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-nickserv-alist
   (quote
    ((Ars nil nil "Census" "IDENTIFY" nil nil nil)
     (Austnet "NickOP!service@austnet.org" "/msg\\s-NickOP@austnet.org\\s-identify\\s-<password>" "nickop@austnet.org" "identify" nil nil nil)
     (Azzurra "NickServ!service@azzurra.org" "/ns\\s-IDENTIFY\\s-password" "NickServ" "IDENTIFY" nil nil nil)
     (BitlBee nil nil "&bitlbee" "identify" nil nil nil)
     (BRASnet "NickServ!services@brasnet.org" "/NickServ\\s-IDENTIFY\\s-senha" "NickServ" "IDENTIFY" nil "" nil)
     (DALnet "NickServ!service@dal.net" "/msg\\s-NickServ@services.dal.net\\s-IDENTIFY\\s-<password>" "NickServ@services.dal.net" "IDENTIFY" nil nil nil)
     (freenode "NickServ!NickServ@services." "This\\s-nickname\\s-is\\s-registered.\\s-Please\\s-choose" "NickServ" "IDENTIFY" nil nil "You\\s-are\\s-now\\s-identified\\s-for\\s-")
     (GalaxyNet "NS!nickserv@galaxynet.org" "Please\\s-change\\s-nicks\\s-or\\s-authenticate." "NS@services.galaxynet.org" "AUTH" t nil nil)
     (GRnet "NickServ!service@irc.gr" "This\\s-nickname\\s-is\\s-registered\\s-and\\s-protected." "NickServ" "IDENTIFY" nil nil "Password\\s-accepted\\s--\\s-you\\s-are\\s-now\\s-recognized.")
     (iip "Trent@anon.iip" "type\\s-/squery\\s-Trent\\s-identify\\s-<password>" "Trent@anon.iip" "IDENTIFY" nil "SQUERY" nil)
     (OFTC "NickServ!services@services.oftc.net" nil "NickServ" "IDENTIFY" nil nil "You\\s-are\\s-successfully\\s-identified\\s-as\\s-")
     (Rizon "NickServ!service@rizon.net" "This\\s-nickname\\s-is\\s-registered\\s-and\\s-protected." "NickServ" "IDENTIFY" nil nil "Password\\s-accepted\\s--\\s-you\\s-are\\s-now\\s-recognized.")
     (QuakeNet nil nil "Q@CServe.quakenet.org" "auth" t nil nil)
     (SlashNET "NickServ!services@services.slashnet.org" "/msg\\s-NickServ\\s-IDENTIFY\\s-password" "NickServ@services.slashnet.org" "IDENTIFY" nil nil nil)
     (bluenet "" "" "NickServ" "IDENTIFY" nil "" ""))))
 '(package-selected-packages
   (quote
    (delight use-package magit company-quickhelp go-tag org-plus-contrib org origami rg go-mode golint gotest eldoc-overlay-mode company-flx flx flx-ido flx-isearch flycheck flycheck-checkbashisms flycheck-gometalinter flycheck-scala-sbt flycheck-swift flycheck-swift3 counsel counsel-bbdb counsel-gtags counsel-osx-app counsel-projectile coverage coverlay ivy company swiper markdown-toc memento go-guru flymd gh-md jekyll-modes markdown-preview-mode markdownfmt ox-gfm vmd-mode yaml-mode zenburn-theme wgrep-ag wget w3 vagrant-tramp vagrant uncrustify-mode ttrss slime-company scala-mode2 rustfmt redshank rbenv rainbow-mode rainbow-identifiers rainbow-delimiters rainbow-blocks racer paredit-everywhere pabbrev osx-pseudo-daemon osx-clipboard osx-browse orglue orglink orgit org-wc org-tracktable org-time-budgets org-readme org-random-todo org-projectile org-presie org-pomodoro org-pdfview org-mobile-sync org-magit org-journal org-gcal org-dotemacs org-doing org-dashboard org-ac ob-sml ob-scala ob-prolog ob-lfe ob-kotlin ob-ipython ob-go o-blog nzenburn-theme nyan-prompt nyan-mode mvn magit-topgit magit-svn magit-stgit magit-gh-pulls magit-gerrit magit-find-file magit-filenotify literate-starter-kit journal helm-company go-scratch go-errcheck go-eldoc go-direx go-autocomplete gnorb flymake-rust flycheck-tip flycheck-rust flycheck-package flycheck-color-mode-line flycheck-clojure exec-path-from-shell ess-R-data-view ercn erc-view-log erc-tweet erc-track-score erc-social-graph erc-image erc-hl-nicks erc-colorize elisp-cache elfeed-web elfeed-org elfeed-goodies electric-spacing electric-operator electric-case eldoro company-web company-go company-c-headers company-auctex code-library cargo bog bbdb2erc auto-indent-mode auto-highlight-symbol auto-dictionary auto-complete-sage auto-complete-nxml auto-complete-exuberant-ctags auto-complete-clang-async atom-one-dark-theme atom-dark-theme arjen-grey-theme aria2 apache-mode ant ansible annotate ag adjust-parens adaptive-wrap ada-ref-man ada-mode ace-window ace-popup-menu ace-link ace-jump-zap ace-jump-helm-line ace-jump-buffer ace-isearch ace-flyspell ac-geiser))))

;; ELPA server setup
(require 'package)

;; be super explicit about what package archives we want
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/") ;; https instead of default http
                         ("org" . "https://orgmode.org/elpa/")
                         ;; marmalade seems dead, last updated 2015, https cert expired in 2018-07
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/") 
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; too clever, if someone ever adds one by default we'll use that instead of breaking, I'd rather break
;;(defun mhb-add-pachage-archive (package-archive-name package-archive-location)
;;  (unless (assoc-default package-archive-name package-archives)
;;    (add-to-list 'package-archives (cons package-archive-name package-archive-location) t)))
;;
;;(mhb-add-pachage-archive "gnu" "https://elpa.gnu.org/packages/") ;; https instead of default http, this does not get overritten using the function above
;;(mhb-add-pachage-archive "org" "https://orgmode.org/elpa/")
;;(mhb-add-pachage-archive "melpa" "https://melpa.org/packages/")
;;(mhb-add-pachage-archive "melpa-stable" "https://stable.melpa.org/packages/")

(package-initialize)

;; cask setup, may interfere with elpa setup above?
;; (when (memq window-system '(mac ns))
;; (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el"))
;; (cask-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
