APP_LIST="$(find . -name "*.apk")"
for APP in ${APP_LIST}; do
    # pm install -r ${APPS}/${FILE}
    # for PERMISSION in $(cat ${APPS}/permissions.txt); do
    #     pm grant ${PERMISSION}
    # done
    echo "find APP is $APP"
    APP_PACKAGE_NAME=$(aapt dump badging $APP | awk -F"['= ]" '/package: name=/ {print $4}')
    echo "APP_PACKAGE_NAME is $APP_PACKAGE_NAME"
    APP_NEED_PERMISSIONS=$(aapt dump badging $APP | awk -F"['= ]" '/uses-permission: name=/ {print $4}')
    # echo $APP_NEED_PERMISSION > ${APP}/../permissions.txt

    PERMISSIONS_FILE="${APP%/*}/permissions.txt"
    >"$PERMISSIONS_FILE"

    # 将权限列表写入文件
    for PERMISSION in ${APP_NEED_PERMISSIONS}; do
        echo "$APP_PACKAGE_NAME $PERMISSION" >>"$PERMISSIONS_FILE"
    done

    # 读取权限列表
    # PERMISSIONS_LIST=$(cat $PERMISSIONS_FILE)
    # for PERMISSION in ${PERMISSIONS_LIST}; do
    #     echo "pm grant $APP_PACKAGE_NAME $PERMISSION"
    # done

    # aapt dump badging $APP | grep package:\ name
    # | grep package: name
    # aapt dump badging $APP | grep uses-permission
    # aapt dump badging  ./SogouInput/SogouInput_11.50_android_sweb.apk | grep package: name
    # aapt dump badging ./SogouInput/SogouInput_11.50_android_sweb.apk | awk -F"['= ]" '/package: name=/ {print $4}'
done
