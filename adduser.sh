#! /bin/bash

set -exu

function add_user {
  user=$1
  sudo useradd -m $user
  sudo chsh $user -s /bin/bash
  # NOPASSWD
  echo "$user ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/users
}

function put_authorized_keys {
  user=$1
  github_user=$2
  sudo -u $user mkdir -p /home/$user/.ssh
  sudo -u $user chmod 700 /home/$user/.ssh
  sudo -u $user curl https://github.com/$github_user.keys -o /home/$user/.ssh/authorized_keys
  sudo -u $user chmod 600 /home/$user/.ssh/authorized_keys
}

add_user nonylene
add_user utgw
add_user wass80

put_authorized_keys nonylene nonylene
put_authorized_keys utgw utgwkk
put_authorized_keys wass80 wass88
