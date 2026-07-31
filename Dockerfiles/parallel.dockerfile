FROM alpine:latest AS base

RUN echo 'alpine up'

CMD ["bash"]

FROM gcc AS build

WORKDIR /usr/local/bin/

RUN echo '#include<stdio.h>\n\
          int main(void)\
            {\
              printf("I am up\\n");\
              return (0);\
            }' > file.c 
RUN gcc file.c --static  -o hello && rm -rf file.c

RUN echo 'busybox up'

FROM base

RUN apk add bash

COPY --from=build /usr/local/bin/hello /usr/bin/

CMD ["/usr/bin/hello"]
