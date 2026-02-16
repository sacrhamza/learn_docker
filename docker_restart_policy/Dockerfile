FROM busybox:latest
COPY --chmod=755 <<"EOF" /start.sh
#!/bin/sh
echo "Starting..."
for i in $(seq 1 5); do
  echo -n "$i.."
  sleep 1
done
echo "Exiting..."
exit "$1"
EOF
CMD ["/start.sh", "1"]
