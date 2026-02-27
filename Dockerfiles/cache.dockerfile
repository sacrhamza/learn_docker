FROM alpine

RUN apk add bash

RUN apk update

CMD ["bash"]
