FROM vault:1.3.4

COPY run.sh /run.sh
COPY unseal.sh /unseal.sh

RUN apk add --no-cache bash; \
    chmod +x /run.sh

ENTRYPOINT ["/run.sh"]

CMD ["/bin/bash", "/unseal.sh"]

