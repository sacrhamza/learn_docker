
FROM debian AS builder

FROM alpine AS base

FROM base

FROM busybox

USER root

WORKDIR /root

# using integers
COPY --from=0 /etc/os-release /root/debian-release
COPY --from=1 /etc/os-release /root/alpine-release


# using aliases
COPY --from=builder /etc/debian_version /root/
COPY --from=fedora /etc/os-release /root/fedora-release
