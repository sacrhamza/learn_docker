# this is the syntax of dockerfile args
# ARG arg='value'

ARG VERSION='5.3.9'
ARG COMMAND='apt update'

FROM bash:${VERSION}

RUN  ${COMMAND}

CMD ["bash", "--version"]
