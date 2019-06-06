# Pull base image.
FROM alpine:3.7
RUN apk add --no-cache mysql mysql-client bash && \
	addgroup mysql mysql && \
	mkdir /scripts && \
	rm -rf /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf

VOLUME ["/var/lib/mysql","/var/log/mysql"]

COPY ./scripts/create-db.sh /scripts/create-db.sh
COPY ./scripts/create-account-tables.sql /scripts/create-account-tables.sql

RUN chmod +x /scripts/create-db.sh

EXPOSE 3306

#ENTRYPOINT ["/scripts/create-db.sh"]
