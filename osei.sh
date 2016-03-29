#!/bin/sh
{
    echo "This script requires super user access."
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    # run inside sudo
    sudo sh <<SCRIPT

  # create file in case we deleted it
  touch /etc/init.d/couchdb
  
  # download and install erlang solutions
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
  dpkg -i erlang-solutions_1.0_all.deb
  apt-get update
  
  # install elixir
  apt-get install -y elixir
  
  # get inotify-tools
  apt-get install -y inotify-tools

SCRIPT
}
