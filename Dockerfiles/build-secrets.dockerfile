FROM alpine

ARG CACHEBUST

RUN apk add bash

RUN --mount=type=secret,id=TOKEN bash -c 'cat /run/secrets/TOKEN > /tmp/file'

# CMD ["sh", "-c", "echo", "$id"]
