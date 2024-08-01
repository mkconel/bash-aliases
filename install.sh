#!/bin/bash

function printUsage() {
    echo "$0 [ARGUMENTS]"
    echo ""
    echo "-i --install:                 installs/updates aliases to the OS-wide Bash configuration."
    echo "-l --legacy-docker-compose:   installs Docker Compose aliases using DCv1 (docker-compose as Python script)."

    exit 1
}

INSTALL=0
INSTALL_LEGACY_DC=0

while [[ $# -gt 0 ]]; do
    case "$1" in
    -i|--install)
        INSTALL=1
        ;;    
    -l|--legacy-docker-compose)
        INSTALL_LEGACY_DC=1
        ;;
    *)
        echo "Unknown option: $1"
        printUsage
        exit 1
        ;;
    esac
    shift
done

if [ $INSTALL != 1 ]; then
    printUsage

    exit 1;
fi

if [[ $EUID -ne 0 ]]; then
    echo "This script needs root permissions to install aliases into system-wide configuration files and root .bashrc"

    exit 1;
fi

echo "Updating Git repo..."
git pull

echo "Copying aliases to system-wide directory..."
cat docker.aliases.sh docker-compose.aliases.sh mutagen.aliases.sh > /etc/bash.conel-bash-aliases

echo "Configuring aliases for non-root users..."
sed -i '/CBA_DC_PREFIX=/d' /etc/profile
if [ $INSTALL_LEGACY_DC == 1 ]; then
    echo "CBA_DC_PREFIX=\"docker-compose\"" >> /etc/profile
else
    echo "CBA_DC_PREFIX=\"docker compose\"" >> /etc/profile
fi
sed -i '/\. \/etc\/bash.conel-bash-aliases/d' /etc/profile
echo ". /etc/bash.conel-bash-aliases" >> /etc/profile

echo "Configuring aliases for root..."
sed -i '/\. \/etc\/bash.conel-bash-aliases/d' /root/.bashrc
echo ". /etc/bash.conel-bash-aliases" >> /root/.bashrc

. /etc/bash.conel-bash-aliases