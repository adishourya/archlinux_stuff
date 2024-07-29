#!/usr/bin/zsh
selected_file=$(fd . -t f ~ | /home/adi/.fzf/bin/fzf)
if [ -n "$selected_file" ]; then
	systemd-run --user xdg-open "$selected_file"
fi
exit


# #!/usr/bin/zsh
# nohup xdg-open $(fd . -t f ~ | ~/.fzf/bin/fzf)
# exit 
#
#
