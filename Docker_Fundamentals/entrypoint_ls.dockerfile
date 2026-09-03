FROM alpine


ENTRYPOINT ["ls"]

# cmd commands will be options for ls
# and also commands specified in the docker run
# docker run -f entrypoint_ls -la
CMD ["-a"]
