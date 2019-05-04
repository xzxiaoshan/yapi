# yapi 可视化在线接口文档

### 安装mongo

自行安装，此处（略）

### 下载镜像

```
docker pull xzxiaoshan/yapi
```

### 创建配置文件

创建配置文件 config.js 内容为：
```
{
  "port": "3000",
  "adminAccount": "admin@admin.com",
  "db": {
    "servername": "192.168.x.x",
    "DATABASE": "yapi",
    "port": 27017,
    "user": "yapi",
    "pass": "yapi",
    "authSource": ""
  },
  "mail": {
    "enable": true,
    "host": "smtp.163.com",
    "port": 465,
    "from": "***@163.com",
    "auth": {
      "user": "***@163.com",
      "pass": "*****"
    }
  }
}
```
配置文件中的内容一目了然，请对应修改之。

### 启动docker

**初始化DB**

```
docker run -it --rm \
  --entrypoint npm \
  -v /docker/yapi/config.js:/api/config.js
  xzxiaoshan/yapi \
  run install-server
```
其中 /docker/yapi/config.js 是上一步在本地创建的配置文件。

**再运行docker**

```
docker run -d \
  --name xzxiaoshan-yapi \
  -p 3000:3000 \
  xzxioashan/yapi
```

### 访问yapi

访问 http://192.168.x.x:3000 登录账号 admin@admin.com，密码 ymfe.org

（END）

