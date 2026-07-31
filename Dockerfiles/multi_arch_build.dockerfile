FROM alpine

RUN apk add bash

CMD ["bash", "--version"]
