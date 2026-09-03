FROM gcc

STOPSIGNAL SIGFPE

ARG SIG='SIGFPE'
ARG VAR='ls'

SHELL ["bash", "-c"]

CMD echo kill ${VAR} 1 > /tmp/file && cat /tmp/file


