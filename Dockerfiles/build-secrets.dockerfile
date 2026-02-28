FROM alpine

ARG CACHEBUST

RUN apk add bash

RUN --mount=type=secret,id=TOKEN bash -c 'touch $id'

# CMD ["sh", "-c", "echo", "$id"]
