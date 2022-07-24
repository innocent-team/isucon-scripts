#! /bin/bash

set -ex

function add_user {
  user=$1
  sudo useradd -m $1
  sudo chsh $1 /bin/bash
  # NOPASSWD
  echo "$1 ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/users
}

function put_authorized_keys {
  user=$1
  github_user=$2
  sudo -u $1 mkdir -p /home/$1/.ssh
  sudo -u $1 chmod 700 /home/$1/.ssh
  sudo -u $1 curl https://github.com/$2.keys -o /home/$1/.ssh/authorized_keys
  sudo -u $1 chmod 600 /home/$1/.ssh/authorized_keys
}

add_user nonylene
add_user utgw
add_user wass80

put_authorized_keys nonylene nonylene
put_authorized_keys utgw utgwkk
put_authorized_keys wass80 wass88
