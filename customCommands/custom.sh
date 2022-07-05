#list all files $path .bash_profile
alias ll="ls -lh"

function makeboot() {
  sudo umount /dev/sd<?><?>  
  sudo dd bs=4M if=path/to/input.iso of=/dev/sd<?> conv=fdatasync  status=progress
}
