# Pull base image.
FROM alpine:latest
RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql && \
	mkdir /scripts && \
	rm -rf /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf

VOLUME ["/var/lib/mysql","/var/log/mysql"]

COPY ./scripts/create-db.sh /scripts/create-db.sh

RUN chmod +x /scripts/create-db.sh

EXPOSE 3306

ENTRYPOINT ["/scripts/create-db.sh"]