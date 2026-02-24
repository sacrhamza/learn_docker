ARG v='edge'

# 1
FROM alpine AS three_layers

# 2
RUN  apk add bash

# 3
WORKDIR /src

USER root

CMD ["echo", "up"]

# to check how many layers an image have
# run:
# docker inspect imagename -f '{{ .RootFS.Layers }}' | wc -l

FROM three_layers AS four_layers

RUN  cat /etc/os-release
