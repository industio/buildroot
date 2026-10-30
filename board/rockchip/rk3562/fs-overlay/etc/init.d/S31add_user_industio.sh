#!/bin/sh

case "$1" in
    start)
        if [ -d /home/industio ]; then
                exit 0
        fi

        mkdir /home

adduser industio << EOF
123456
123456
EOF

smbpasswd -a industio << EOF
123456
123456
EOF

passwd root << EOF
123456
123456
EOF

        ;;
esac
exit 0
