(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services sound)
  #:use-module (gnu packages)
  #:use-module (gnu packages file)
  #:use-module (gnu services)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp))

(define bash-env 
  '(("EDITOR" . "nvim")
    ;("XDG_DATA_DIRS" . "$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share")
    ("GUIX_PROFILE" . "$HOME/.guix-profile")))

(define bash-aliases 
  '(("vi" . "nvim")
    ("vim" . "nvim")))

(define bashrc-files
  ;(list (plain-file "fzf-bindings" "source $HOME/scripts/key-bindings.bash"))

  )

(define home-config
  (home-environment
    (packages (specifications->packages
		(list 
		  "bash"
		  "emacs" 
		  "fastfetch"
		  "git" 
		  "neovim")))
    (services
      (list
        (service home-bash-service-type
		 (home-bash-configuration
		   (environment-variables bash-env)
		   ;(bashrc bashrc-files)
		   (aliases bash-aliases)))
	(service home-dbus-service-type)
	(service home-pipewire-service-type)

        (service home-files-service-type
         `((".guile" ,%default-dotguile)
           (".Xdefaults" ,%default-xdefaults)))

        (service home-xdg-configuration-files-service-type
         `(("gdb/gdbinit" ,%default-gdbinit)
           ("nano/nanorc" ,%default-nanorc)))))))

home-config
