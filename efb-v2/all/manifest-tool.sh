#!/bin/bash
# https://github.com/estesp/manifest-tool
# ref1:https://github.com/ryank231231/efb-wechat-docker
# ref2:https://github.com/Mikubill/efb-wechat-docker
# ref3:https://github.com/snowdreamtech/frp
# ref4:https://github.com/docker-library/official-images

# please exec 'docker login'
# efb-v2.yaml 文件中的 bmwcto/efb-v2:1 和 bmwcto/efb-v2:arm32v7 是已经推送到hub的镜像，这只是一个智能组合工具
# efb-v2 

chmod +x ./manifest-tool
./manifest-tool push from-spec efb-v2.yaml
