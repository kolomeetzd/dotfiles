xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 192

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xset -r rate 400 25

# Start ssh-agent as a wrapper program, so
# only one instance lives and dies with the entire X session.
#
# See: <https://wiki.archlinux.org/title/SSH_keys#ssh-agent_as_a_wrapper_program>.
exec ssh-agent dbus-launch awesome
