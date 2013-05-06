#!/bin/sh
if [ "$1" != --force ]; then
    echo "Please read the setup script and confirm that it doesn't break your system."
    exit 1
fi

[ -z "$ROOT" ] && ROOT=

echo "==> Installing /sbin/rc, /etc/inittab"
install -Dm755 rc "$ROOT"/sbin/rc
install -Dm644 inittab "$ROOT"/etc/inittab

echo "==> Installing extras"
cd extra
install -Dm644 _minirc "$ROOT/usr/share/zsh/site-functions/_minirc"
install -Dm755 shutdown.sh "$ROOT/sbin/shutdown"

echo "==> Linking busybox to /sbin/{init,halt,poweroff,reboot}"
for i in init halt poweroff reboot; do
    ln -sf $(which busybox) "$ROOT"/sbin/$i
done

echo ":: Append 'init=/sbin/init' to your kernel line in your bootloader"
echo "   to replace your current init with minirc"
echo ":: It is strongly recommended to use systemd's udev by adding"
echo "   UDEV=systemd to /etc/minirc.conf."

# Run "./setup.sh --force" to use the script
