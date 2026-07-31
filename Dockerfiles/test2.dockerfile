FROM alpine

RUN apk add nodejs
RUN apk add bash

CMD ["bash"]
