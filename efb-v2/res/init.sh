#!/usr/bin/with-contenv bash
# export EFB_DATA_PATH='/opt/app/efb_config'

mkdir -p ${EFB_DATA_PATH}
cp -r -u /opt/app/bak_config/. ${EFB_DATA_PATH}
chown -R 1000:1000 ${EFB_DATA_PATH}
sed -i "s/token123456/$TOKEN/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml 
sed -i "s/admin123456/$ADMIN/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml

#ln -s ${EFB_DATA_PATH} /efb

if test -z "$PROXYURL";then 
    ehforwarderbot -p ${PROFILE}
else
    sed -i "s/^#//g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
    sed -i "s/127.0.0.1/$PROXYURL/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
    sed -i "s/1024/$PROXYPORT/g" ${EFB_DATA_PATH}/profiles/${PROFILE}/blueset.telegram/config.yaml
    ehforwarderbot -p ${PROFILE}
fi