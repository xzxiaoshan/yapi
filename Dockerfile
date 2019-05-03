FROM alpine/git:latest
MAINTAINER xzxiaoshan <365384722@qq.com>

WORKDIR /gitcode/

RUN set -x && \
    git clone https://github.com/YMFE/yapi.git

FROM node:alpine

WORKDIR /yapi/vendors/

COPY --from=0 /gitcode/yapi/ .

RUN set -x && \
    npm install --production --registry https://registry.npm.taobao.org && \
    npm install -S pm2 && \
    echo '#!/bin/sh' > start.sh && \
    echo 'if [ ! -f "/install-server-ok" ];then' >> start.sh && \
    echo 'npm run install-server' >> start.sh && \
    echo 'echo ok > /install-server-ok' >> start.sh && \
    echo 'fi' >> start.sh && \
    echo 'node server/app.js' >> start.sh && \
	chmod +x start.sh

CMD start.sh
