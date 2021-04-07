#!/usr/bin/with-contenv bash
mkdir -p /opt/app/efb_config
cp -r -u /opt/app/efb_confbak/. /opt/app/efb_config
chown -R 1000:1000 /opt/app/efb_config
sed -i "s/token123456/$TOKEN/g" /opt/app/efb_config/profiles/${PROFILE}/blueset.telegram/config.yaml 
sed -i "s/admin123456/$ADMIN/g" /opt/app/efb_config/profiles/${PROFILE}/blueset.telegram/config.yaml
sed -i "s/127.0.0.1/$PROXYURL/g" /opt/app/efb_config/profiles/${PROFILE}/blueset.telegram/config.yaml
sed -i "s/1024/$PROXYPORT/g" /opt/app/efb_config/profiles/${PROFILE}/blueset.telegram/config.yaml
ln -s /opt/app/efb_config /efb
ehforwarderbot -p ${PROFILE}
