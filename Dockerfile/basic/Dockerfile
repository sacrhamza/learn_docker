FROM alpine:latest

LABEL maintainer="sacrhamzaschool@gmail.com"

WORKDIR /src

#  install deps
RUN apk add make readline-dev gcc git musl-dev

# clone the project
RUN git clone https://github.com/sacrhamza/42-minishell.git

# setup
# RUN git -C /src/42-minishell fetch origin
# RUN git -C /src/42-minishell reset --hard origin/master

# make
RUN make -C /src/42-minishell
RUN make -C /src/42-minishell clean


CMD ["/src/42-minishell/minishell"]
