# Pull base image.
FROM alpine:latest
RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql && \
	mkdir /scripts && \
	rm -rf /var/cache/apk/*

COPY ./my.cnf /etc/mysql/my.cnf
COPY ./update.sh /scripts/update.sh
COPY ./accounts.sql /scripts/accounts.sql
RUN chmod +x /scripts/update.sh
ENTRYPOINT ["/scripts/update.sh"]
