# this is the syntax of dockerfile args
# ARG arg='value'


ARG VERSION='5.3.9'

FROM bash:${VERSION}

ARG COMMAND='apk add fish'

RUN  ${COMMAND}

CMD ["fish"]
