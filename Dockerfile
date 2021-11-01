FROM alpine:3.12

ENV REVIEWDOG_VERSION=v0.13.0

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache --update add git curl wget openjdk11 \
    && rm -rf /var/cache/apk/*

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
