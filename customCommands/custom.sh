# run "source .bashrc" to load anything added to .bashrc

function makeboot() {
  wget -nc https://files.kde.org/neon/images/user/20220707-0946/neon-user-20220707-0946.iso -O Downloads/neon.iso
  sudo umount /dev/sda 
  sudo dd bs=4M if=Downloads/neon.iso of=/dev/sda conv=fdatasync  status=progress
}
export -f makeboot
