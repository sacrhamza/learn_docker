FROM alpine:latest AS base

RUN echo 'alpine up'

CMD ["bash"]

FROM busybox

RUN echo 'busybox up'

FROM base

RUN apk add bash

# COPY --from=base /sbin/apk /bin/
# COPY --from=1 /bin/busybox /bin/

