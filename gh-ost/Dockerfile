FROM golang:1.22-alpine3.21 AS build

RUN apk add --no-cache \
  git \
  bash \
  curl \
  perl-utils \
  ;

RUN git clone https://github.com/github/gh-ost && \
    cd gh-ost && \
    git checkout release-1.1.7 && \
    script/build && \
    mv bin/gh-ost /usr/local/bin/gh-ost && \
    chmod +x /usr/local/bin/gh-ost

FROM alpine:3.21 AS production

COPY --from=0 /usr/local/bin/gh-ost /usr/local/bin/gh-ost

ENTRYPOINT ["gh-ost"]
