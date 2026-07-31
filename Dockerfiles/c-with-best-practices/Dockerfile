FROM gcc:13.4.0 AS builder

RUN apt update
RUN apt install make -y

WORKDIR /app

COPY ./main.c ./Makefile .

RUN make build

FROM busybox:1.37.0-glibc AS app

COPY --from=builder /app /app

CMD ["/app/up"]

FROM busybox
COPY --from=app /app /app
CMD ["/app/up"]
