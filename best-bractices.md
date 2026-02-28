1. use official docker images as Base Image
```dockerfile
# FROM ubuntu
# RUN apt update && apt install -y node && rm -rf /var/lib/apt/lists*/
# instead use
FROM node
```

2.
