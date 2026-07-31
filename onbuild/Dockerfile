FROM alpine AS builder

RUN apk add gcc musl-dev bash

WORKDIR /usr/bin/src

ONBUILD COPY . .
ONBUILD RUN gcc *.c -o /usr/bin/magick
ONBUILD CMD ["magick"]

CMD ["bash"]

FROM builder
