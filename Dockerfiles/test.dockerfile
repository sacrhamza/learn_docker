FROM alpine

RUN apk add nodejs
RUN apk add gcc 

COPY ./multi_arch_build.sh .

CMD ["sh"]
