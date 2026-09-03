# just nvim with one

FROM debian

RUN apt update && apt install file curl wget zip tar vim -y

WORKDIR /src

# you can add to get repo from github or gitlab
ADD https://github.com/sacrhamza/one.git /src

RUN /src/one -i nvim

CMD ["sh", "-c", "~/.local/bin/nvim"]

