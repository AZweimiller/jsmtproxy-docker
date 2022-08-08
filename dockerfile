FROM node:slim

WORKDIR /home/jsmtproxy

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/FreedomPrevails/JSMTProxy.git .

RUN npm install pm2 -g

ARG MTPROTO_PORT
ENV MTPROTO_PORT ${MTPROTO_PORT:-6969}

EXPOSE ${MTPROTO_PORT}

ARG MTPROTO_SECRET
ENV MTPROTO_SECRET ${MTPROTO_SECRET:-DEADBEEFDEADBEEFDEADBEEF}

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]

CMD ["pm2-runtime", "start", "mtproxy.js", "-i", "max"]
