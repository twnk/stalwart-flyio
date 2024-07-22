FROM --platform=linux/amd64 stalwartlabs/mail-server:latest

COPY config.toml /opt/stalwart-mail/etc/