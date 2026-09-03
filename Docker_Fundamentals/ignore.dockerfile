FROM alpine
# .dockerignore has this:
# ignore.dockerfile
# .dockerignore

WORKDIR /usr/local/test

COPY . .

CMD ["ls", "-la"]
