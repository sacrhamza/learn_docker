FROM gcc:13.4.0 as builder

RUN apt update
RUN apt install make -y

WORKDIR /app

COPY ./main.c .

RUN make build

FROM busybox:1.37.0-glibc

COPY --from=builder /app /app

CMD ["/app/a.out"]
