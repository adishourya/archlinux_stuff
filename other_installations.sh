

#make sure github-cli is installed for this
# gh repo clone adishourya/neovim_config ~/.config/nvim
# gh repo clone adishourya/kitty ~/.config/kitty
# gh repo clone adishourya/lean_zellij ~/.config/zellij

# oh my zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# fzf-git
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install

# polybar
# git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
# cd polybar-themes
# chmod +x setup.sh
# ./setup.sh
#
# Anaconda
# get links from here
# https://www.anaconda.com/download/success


#------ For Elenapan's Awesome config
# git clone https://aur.archlinux.org/awesome-git.git ./awesome_git 
# cd ./awesome_git/
# makepkg -fsri

# # For automatically launching mpd on login
# systemctl --user enable mpd.service
# systemctl --user start mpd.service
# # For charger plug/unplug events (if you have a battery)
# sudo systemctl enable acpid.service
# sudo systemctl start acpid.service
# #--- copy its files
# git clone https://github.com/elenapan/dotfiles
# cd dotfiles
# [ -e ~/.config/awesome ] && mv ~/.config/awesome ~/.config/awesome-backup-"$(date +%Y.%m.%d-%H.%M.%S)" # Backup current configuration
# cp -r config/awesome ~/.config/awesome
#
# pacman -S --needed git base-devel
# git clone https://aur.archlinux.org/yay-bin.git
# cd yay-bin
# makepkg -si

# ags
mkdir -p ~/.config/ags
git clone https://github.com/Aylur/ags.git /tmp/ags
cp -r /tmp/ags/example/simple-bar/* ~/.config/ags

# optionally setup types
ags --init -c ~/.config/ags/config.js
