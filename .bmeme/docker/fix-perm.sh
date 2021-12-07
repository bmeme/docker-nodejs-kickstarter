#!bin/bash

NODE_UID=`id -u node`
NODE_GID=`id -g node`

if [[ ! -z "$FIX_UID" ]] && [[ "$FIX_UID" != "$NODE_UID" ]]; then
    echo "Fixing UID permissions"

    # Check if $FIX_UID already exists in container
    PREV_USER=`getent passwd $FIX_UID | cut -d: -f1`
    if [ ! -z "$PREV_USER" ]; then
        # Move data from FIX_UID to 888
        find / -user ${FIX_UID} -exec chown -h 888 {} \; 2>/dev/null
        usermod -u 888 $PREV_USER
    fi

    find / -user ${NODE_UID} -exec chown -h ${FIX_UID} {} \; 2>/dev/null
    usermod -u ${FIX_UID} node
else
    echo "UID permissions are ok"
fi

if [[ ! -z "$FIX_GID" ]] && [[ "$FIX_GID" != "$NODE_GID" ]]; then
    echo "Fixing GID permissions"

    # Check if $FIX_GID already exists in container
    PREV_GROUP=`getent group $FIX_GID | cut -d: -f1`
    if [ ! -z "$PREV_GROUP" ]; then
        # Move data from FIX_GID to 888
        find / -group ${FIX_GID} -exec chgrp -h 888 {} \; 2>/dev/null
        groupmod -g 888 $PREV_GROUP
    fi

    find / -group ${NODE_GID} -exec chgrp -h ${FIX_GID} {} \; 2>/dev/null
    groupmod -g ${FIX_GID} node
else
    echo "GID permissions are ok"
fi
