### Docker CLI 常规操作
### [ref 1](https://www.runoob.com/docker/docker-tutorial.html)

- 拉取镜像  
  `docker pull arm32v7/python:alpine3.12`

- 进入Dockerfile目录后再构建镜像  
  `docker build -t bmwcto/efb:arm32v7 .`

- 新建tags  
  `docker tag bmwcto/efb:arm32v7 bmwcto/efb-v2:arm32v7`

- 登录 hub.docker.com  
  `docker login`

- 推送到 hub.docker.com  
  `docker push bmwcto/efb-v2:arm32v7`

- 退出 hub.docker.com  
  `docker logout`

- 查看所有镜像  
  `docker images`

- 查看所有镜像所占用的磁盘空间大小  
  `docker system dh -v`

- 查看当前的容器(不包含未运行的)  
  `docker ps`

- 查看当前的容器(包含未运行的)  
  `docker ps -a`

- 以xxx为名从nnn镜像创建一个新的容器并在后台执行  
  `docker run -d -t --name "xxx" nnn`

- 停止多个容器  
  `docker stop xxx yyy`

- 启动多个容器（重启为restart）  
  `docker start xxx yyy`

- 进入容器  
  `docker exec -it xxx sh`  
  后面的sh是进入容器后要运行的命令

- 进入容器后执行一个宿主机的脚本  
  `docker exec -it xxx --entrypoint=/root/test.sh`

- 删除多个镜像  
  `docker image rm xxx yyy`

- 查看容器日志（ `-f` 一直跟随）  
  `docker logs xxx`

- 搜索镜像  
  `docker search efb-v2`

- 容器的详细信息  
  `docker inspect xxx`

- 更新某个容器的启动方式为 `always`  
  `docker update --restart always xxx`

- 以非默认文件名构建镜像  
  `docker build -f Dockerfile.amd64 -t bmwcto/efb:amd64 .`  
  `docker build -f Dockerfile.arm32v7 -t bmwcto/efb:arm32v7 .`
