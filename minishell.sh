#!/bin/bash


docker build -t minishell:latest .
docker run --name minishell -it minishell:latest
