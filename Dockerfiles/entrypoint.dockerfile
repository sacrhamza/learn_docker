FROM alpine as builder

RUN apk add bash

# this demonstrate that you can actually override ENTRYPOINT
# in multibuild stages
ENTRYPOINT ["/bin/bash"]

FROM builder

RUN apk add curl

ENTRYPOINT ["/bin/sh"]
