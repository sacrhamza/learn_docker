* let us read that docker-compose.yml file

```docker-compose

services:
    bash:
        image: bash
        command: bash
        stdin_open: true 
        tty: true

```
* you can run bash againse the service: "bash"
```bash

docker compose run bash bash

```

#### healthcheck
```tex
The HEALTHCHECK instruction has two forms:

    HEALTHCHECK [OPTIONS] CMD command (check container health by running a command inside the container)
    HEALTHCHECK NONE (disable any healthcheck inherited from the base image)

```
* options of healthcheck:
    1. interval (default 30s)
    2. timeout (default 30s)
    3. start-period (default 0s)
    4. start-interval (default 5s)
    6. retries: (default 3)
> explanation:

    -> interval:
```tex
The health check will first run interval seconds after the container is started, and then again interval seconds after each previous check completes.
```

    -> timeout:
```tex
If a single run of the check takes longer than timeout seconds then the check is considered to have failed. The process performing the check is abruptly stopped with a SIGKILL.

```

    -> retries:
```tex
It takes retries consecutive failures of the health check for the container to be considered unhealthy.
```

    -> 

* **docker compose ls** gives a brief overview of all running
Compose apps, including how many services are running and the
location of the Compose file.

