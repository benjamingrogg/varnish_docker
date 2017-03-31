FROM alpine:3.5


RUN apk update && \
    apk upgrade && \
    apk add varnish 

COPY default.vcl /etc/varnish

#EXPOSE 8080

ENTRYPOINT ["varnishd", "-F", "-f", "/etc/varnish/default.vcl", "-a", "8080"]


