FROM node:9.2-alpine as builder

WORKDIR /home/

RUN set -x && \
    apk add --no-cache git python make openssl tar gcc && \
    git clone https://github.com/YMFE/yapi.git && \
	mkdir /api && mv /home/yapi /api/vendors && cd /api/vendors && \
    npm install --production --registry https://registry.npm.taobao.org

FROM node:9.2-alpine
MAINTAINER xzxiaoshan <365384722@qq.com>

ENV TZ="Asia/Shanghai"
WORKDIR /api/vendors

COPY --from=builder /api/vendors /api/vendors

RUN set -x && \
    cp /api/vendors/config_example.json /api/config.json

EXPOSE 3000
ENTRYPOINT ["node","server/app.js"]
