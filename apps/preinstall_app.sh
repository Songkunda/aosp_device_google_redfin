#!/system/bin/sh
APPS=/system/preinstall
FILE_LIST=$(ls ${APPS} | grep apk/)
if [ ! -f /data/app/did ]; then
    for FILE in ${FILE_LIST}; do
        pm install -r ${APPS}/${FILE}
        for PERMISSION in $(cat ${APPS}/${FILE}-permissions.txt); do
            pm grant ${PERMISSION}
        done
    done

    echo 1 >/data/app/did
fi
