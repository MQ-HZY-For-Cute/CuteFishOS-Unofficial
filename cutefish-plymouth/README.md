# cutefish-plymouth

Cutefish Plymouth Theme

# How to install

sudo mv cutefish-plymouth /usr/share/plymouth/themes

sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/cutefish-plymouth/cutefish.plymouth 100

sudo update-alternatives --config default.plymouth

Select cutefish-plymouth either 0, 1, 2, 3 ect......

sudo update-initramfs -u

Reboot.
