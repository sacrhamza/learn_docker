FROM alpine AS base

WORKDIR /usr/src/

RUN apk add gcc  musl-dev git make readline-static ncurses-static readline-dev
RUN git clone https://github.com/sacrhamza/42-minishell.git /usr/src/minishell
RUN make -C /usr/src/minishell CFLAGS=-static

FROM busybox AS final

# FROM scratch

WORKDIR /bin

COPY --from=base /usr/src/minishell/minishell ./

CMD ["minishell"]
