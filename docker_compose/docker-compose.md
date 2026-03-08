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
