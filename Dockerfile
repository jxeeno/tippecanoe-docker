FROM alpine

RUN apk add --no-cache sudo git g++ make libgcc libstdc++ sqlite-libs sqlite-dev zlib-dev bash curl \
  && addgroup -S tippecanoe && adduser -S -G tippecanoe tippecanoe \
  && cd /root \
  && git clone https://github.com/felt/tippecanoe.git tippecanoe \
  && cd tippecanoe \
  && make \
  && make install \
  && rm -rf /root/tippecanoe \
  && apk del git g++ make sqlite-dev

USER tippecanoe
WORKDIR /home/tippecanoe
ENTRYPOINT /bin/bash
