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

echo "Updating Git repo..."
git pull

sed -i '/CBA_DC_PREFIX=/d' /etc/bash.bashrc
if [ $INSTALL_LEGACY_DC == 1 ]; then
    echo "CBA_DC_PREFIX=\"docker-compose\"" >> /etc/bash.bashrc
else
    echo "CBA_DC_PREFIX=\"docker compose\"" >> /etc/bash.bashrc
fi

cat docker.aliases.sh docker-compose.aliases.sh mutagen.aliases.sh > /etc/bash.conel-bash-aliases

sed -i '/source \/etc\/bash.conel-bash-aliases/d' /etc/bash.bashrc
echo "source /etc/bash.conel-bash-aliases" >> /etc/bash.bashrc

source /etc/bash.conel-bash-aliases