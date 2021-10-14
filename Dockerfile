FROM golang:1.17-alpine

RUN apk update && \
    apk upgrade && \
    apk add build-base && \
    apk add git && \
    git clone https://github.com/cli/cli.git -b v2.0.0 gh-cli && \
    cd gh-cli && \
    make && \
    mv ./bin/gh /usr/local/bin/

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
