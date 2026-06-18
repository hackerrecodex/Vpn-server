FROM alpine:latest

# Xray-core इंस्टॉल करें
RUN apk add --no-cache curl unzip bash openssl && \
    mkdir -p /tmp/xray && \
    curl -L -o /tmp/xray/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray/xray.zip -d /usr/local/bin/ && \
    rm -rf /tmp/xray && \
    chmod +x /usr/local/bin/xray

# फाइल्स कॉपी करें
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 10000

CMD ["/entrypoint.sh"]