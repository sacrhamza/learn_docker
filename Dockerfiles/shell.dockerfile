FROM debian

RUN  apt update && apt install zsh fish -y

SHELL ["bash", "-c"]

RUN ${SHELL} --version > /tmp/bash-version

SHELL ["fish", "-c"]

RUN math 5 + 500  > /tmp/fish-math

CMD ["cat", "/tmp/bash-version", "/tmp/fish-math"]
