;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules 
  (gnu)
  (guix inferior)
  (guix channels)
  (gnu home services sound)
  (gnu packages audio)
  (gnu packages bash)
  (gnu packages fonts)
  (gnu packages linux)
  (gnu services docker)
  (gnu services pm)
  (gnu services syncthing)
  (gnu system setuid)
  (nongnu packages linux)
  (nongnu system linux-initrd))
(use-service-modules dbus cups desktop docker sound networking ssh xorg)

(define %my-services
  (modify-services %desktop-services
		   (gdm-service-type config =>
				     (gdm-configuration
				       (inherit config)
				       (wayland? #t)))))

(define %bluetooth-packages
  '("bluez"
    "bluez-alsa"
    "blueman"))

(define %development-packages
  '("bash"
    "curl"
    "containerd"
    "docker"
    "docker-cli"
    "docker-compose"
    "emacs"
    "fzf"
    "git"
    "ncurses"
    "neovim"
    "openssh-sans-x"
    "sbcl"
    "tree-sitter"
    "unzip"
    ))

(define %font-packages
  '("font-awesome"
    "font-misc-misc"
    "font-fira-code"))

(define %hyprland-packages
  '("hyprland"
    "hyprland-protocols"
    "hyprland-qtutils"
    "hyprcursor"
    "hyprlang"
    "hyprutils"
    "xdg-desktop-portal-hyprland"
    ))

(define %gui-packages
  '("acpilight"
    "flatpak"
    "flatpak-xdg-utils"
    "gnome-tweaks"
    "keepassxc"
    "kitty"
    "nextcloud-client"
    "pavucontrol"
    "steam"
    "steam-devices-udev-rules"
    "swayidle"
    "swaylock-effects"
    "syncthing-gtk"
    "waybar"
    "wofi"
    ;"xdg-desktop-portal"
    "xdg-desktop-portal-wlr"
    ;"xdg-desktop-portal-gtk"
    "xorg-server-xwayland"))

(define %internet-packages
  '("firefox"))

(define %multimedia-packages
  '("gimp"
    "vlc"
    "ffmpeg"
    "imagemagick"
    "pipewire"
    "wireplumber"
    ))
(define %xfce-stuff
  '(
    "xfce4-pulseaudio-plugin"
    "xfce4-screensaver"
    "xfce4-screenshooter"
    "xfce4-session"
    "xfce4-whiskermenu-plugin"
    ))

(define etc-sudoers-config
  (plain-file "etc-sudoers-config"
	      "Defaults timestamp_timeout=300
root      ALL=(ALL) ALL
wheel     ALL=(ALL) ALL
pwarnes   ALL=(ALL) ALL,NOPASSWD:/home/pwarnes/.guix-home/profile/sbin/shutdown,/run/current-system/profile/bin/loginctl,/home/pwarnes/.guix-home/profile/sbin/reboot
pwarnes2   ALL=(ALL) ALL,NOPASSWD:/home/pwarnes/.guix-home/profile/sbin/shutdown,/run/current-system/profile/bin/loginctl,/home/pwarnes/.guix-home/profile/sbin/reboot
swarnes   ALL=(ALL) NOPASSWD:/home/pwarnes/.guix-home/profile/sbin/shutdown,/run/current-system/profile/bin/loginctl,/home/pwarnes/.guix-home/profile/sbin/reboot
ewarnes   ALL=(ALL) NOPASSWD:/home/pwarnes/.guix-home/profile/sbin/shutdown,/run/current-system/profile/bin/loginctl,/home/pwarnes/.guix-home/profile/sbin/reboot"))


(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/Chicago")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "hermes")
  (sudoers-file etc-sudoers-config)

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "pwarnes")
                  (comment "Paul Warnes")
                  (group "users")
                  (home-directory "/home/pwarnes")
                  (supplementary-groups '("wheel" "lp" "docker" "netdev" "input" "audio" "video")))
                (user-account
                  (name "pwarnes2")
                  (comment "Paul Warnes")
                  (group "users")
                  (home-directory "/home/pwarnes2")
                  (supplementary-groups '("wheel" "lp" "docker" "netdev" "input" "audio" "video")))
                (user-account
                  (name "swarnes")
                  (comment "Stephanie Warnes")
                  (group "users")
                  (home-directory "/home/swarnes")
                  (supplementary-groups '("wheel" "netdev" "lp" "audio" "video")))
                (user-account
                  (name "ewarnes")
                  (comment "Eris Warnes")
                  (group "users")
                  (home-directory "/home/ewarnes")
                  (supplementary-groups '("wheel" "netdev" "audio" "lp" "video")))
                %base-user-accounts))
  
  (packages
    (append
      (map specification->package
	   (append 
	     %development-packages
	     %font-packages
	     %hyprland-packages
	     %gui-packages
	     %internet-packages
	     %multimedia-packages
	     %bluetooth-packages
         %xfce-stuff))
      %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
    (append (list 
	      (udev-rules-service 'light light)
	      (service bluetooth-service-type 
		       (bluetooth-configuration 
			 (auto-enable? #t)))
	      (service containerd-service-type)
	      (service docker-service-type)
	      ;(service syncthing-service-type
		  ;     (syncthing-configuration
			; (user "pwarnes")))
	      (service tlp-service-type
		       (tlp-configuration
			 (cpu-scaling-governor-on-ac '("performance"))
			 (sched-powersave-on-bat? #t)))
	      (service power-profiles-daemon-service-type)
	      (service screen-locker-service-type
		       (screen-locker-configuration
			 (name "swaylock") 
			 (program (file-append 'swaylock "/bin/swaylock")) 
			 (using-pam? #t)
			 (using-setuid? #f)))
	      (service xfce-desktop-service-type)
	      (service gnome-desktop-service-type)
	      (set-xorg-configuration
		(xorg-configuration (keyboard-layout keyboard-layout)))

	      (extra-special-file "/bin/bash" (file-append bash "/bin/bash"))
	      )

	    ;; This is the default list of services we
	    ;; are appending to.
	    %desktop-services))


  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (mapped-devices (list (mapped-device
                          (source (uuid
                                   "59b092cd-4b7b-4ef8-82d5-8afc2ebb808a"))
                          (target "cryptroot")
                          (type luks-device-mapping))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "4909-053B"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device "/dev/mapper/cryptroot")
                         (type "ext4")
                         (dependencies mapped-devices)) %base-file-systems)))
