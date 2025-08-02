# .dotfiles

Collection of my currently used configurations. Nothing too crazy. Mainly documenting for myself when things break.

### Tools 
- [i3](https://i3wm.org/)
- [polybar](https://github.com/polybar/polybar)
- [alacritty](https://alacritty.org/)

### Setup Notes
Since `iwd` is being used, other network supplicants need to be disabled

```bash
sudo systemctl disable NetworkManager
sudo systemctl disable systemd-networkd```

### Usage Notes

```bash
udisksctl mount -b /dev/sda1
```
