# .dotfiles

Collection of my currently used .dotfiles. Nothing too crazy. Mainly documenting for myself when things break.

### Currently used tools
- [i3](https://i3wm.org/)
- [polybar](https://github.com/polybar/polybar)
- [alacritty](https://alacritty.org/)

### Setup Notes

Install font
```bash
mkdir -p ~/.fonts
unzip JetBrainsMono.zip -d ~/.fonts
fc-cache -fv
```

Packages required (Ubuntu 24.04)
```bash
sudo apt-get install i3 stow feh polybar pulseaudio-utils ibus-hangul maim xdotool xclip brightnessctl pavucontrol
```

List connected monitors
```bash
xrandr -q | grep " connected"
```

Configure Hangul input
```bash
ibus-setup
```
