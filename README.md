# WTH is this?

A quick and dirty set of aliases for Docker, Docker Compose, and Mutagen. Especially useful for the lazy. Creating this thing took a whole 30 minutes, so perfect functionality is not expected.


# Installation

Run as root to install to /etc/bash.bashrc. It should work on any Debian-like distribution.

    git clone https://github.com/mkconel/bash-aliases.git
    cd bash-aliases/
    chmod +x install.sh
    ./install.sh -i

Using older Docker Compose (docker-compose (python script)) instead of docker compose (a.k.a. docker compose plugn)?

    ./install .sh -i -l
