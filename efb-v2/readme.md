## usage

* step 1

```
mkdir -p $HOME/docker/efbwechat &&\
docker run -d -t --name "efbwechat" -v $HOME/docker/efbwechat:/opt/app/efb_config:rw -e TOKEN=xxx -e ADMIN=xxx -e PROXYURL=xxxx -e PROXYPORT=xx bmwcto/efb-v2
```

TOKEN: Telegram Bot Token (@botfather)

ADMIN: Your Telegram ID (@idbot)

PROXYURL: Your Socks5 proxy url

PROXYPORT: Your Socks5 proxy port

将里面的 token 和 admin 的值分别换为 bottoken 和 Chat ID

PROXYURL 和 PROXYPORT 分别换成 socks5的代理地址和端口


* step 2

```
docker logs -f efbwechat 
```

Scan the QRCode to login

打开手机微信扫码，扫描屏幕上的二维码，然后确认登录。

* 扫码后的目录结构：

```
efbwechat
├── modules
│   ├── filter.py
│   └── __pycache__
│       └── filter.cpython-39.pyc
└── profiles
    └── default
        ├── blueset.telegram
        │   ├── config.yaml
        │   └── tgdata.db
        ├── blueset.wechat
        │   ├── wxpy.pkl
        │   └── wxpy_puid.pkl
        ├── config.yaml
        └── filter.FilterMiddleware
            ├── chat_id_filter.db
            └── config.yaml
```

* info:

```
您正在使用 EFB Telegram 主端 2.2.3，运行于默认配置档案与实例、EFB 版本 2.1.0。
已激活 1 个从端：
- 💬 WeChat Slave (blueset.wechat, 2.0.4)

已启用 1 个中间件：
- Filter Middleware (filter.FilterMiddleware, 1.1.1)
```

* backup efb data (export from cp of docker):

`mkdir -p $HOME/docker/efbwechat_bak && docker cp efbwechat:/opt/app/efb_config/profiles/default/. $HOME/docker/efbwechat_bak`

* import efb data:

```mkdir -p $HOME/docker/efbwechat/profiles/default && cp -r $HOME/docker/efbwechat_bak/. $HOME/docker/efbwechat/profiles/default/ && docker run -d -t --name "efbwechat" -v $HOME/docker/efbwechat:/opt/app/efb_config:rw -e TOKEN=xxx -e ADMIN=xxx -e PROXYURL=xxxx -e PROXYPORT=xx bmwcto/efb-v2```


