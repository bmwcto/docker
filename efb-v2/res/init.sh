#!/usr/bin/with-contenv bash
# export EFB_DATA_PATH='/efb/config'

bmw(){
mkdir -p ${EFB_DATA_PATH}
cp -r -u /$BMWHOME/bak_config/. ${EFB_DATA_PATH}

if test -n "$UID";then 
    chown -R $UID /$BMWHOME
fi

if test -n "$TOKEN";then 
    sed -i "s/token123456/$TOKEN/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
fi

if test -n "$ADMIN";then 
    sed -i "s/admin123456/$ADMIN/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
fi

if test -n "$PROXYURL";then 
    sed -i "s/^#//g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
    sed -i "s/127.0.0.1/$PROXYURL/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
fi

if test -n "$PROXYPORT";then 
    sed -i "s/^#//g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
    sed -i "s/1024/$PROXYPORT/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
fi
/sbin/su-exec $UID /usr/local/bin/python /usr/local/bin/ehforwarderbot -p ${PROFILE}
}

bmw