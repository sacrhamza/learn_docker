FROM debian

RUN  apt update && apt install zsh fish -y

SHELL ["bash", "-c"]

# RUN and CMD deponds on a shell to run commands

RUN echo ${SHELL} > /tmp/shell
RUN ${SHELL} --version > /tmp/bash-version

SHELL ["fish", "-c"]

RUN math 5 + 500  > /tmp/fish-math

# CMD ["cat", "/tmp/bash-version", "/tmp/fish-math", "/tmp/shell"]
# CMD cat /tmp/bash-version /tmp/fish-math /tmp/shell

CMD echo hey && echo 'i use shell btw'

# The following instructions can be affected by 
# the SHELL instruction when the shell form 
# of them is used in a Dockerfile: RUN, CMD and ENTRYPOINT.
