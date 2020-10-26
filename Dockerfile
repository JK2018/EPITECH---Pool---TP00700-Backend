FROM elixir:1.8.2-otp-22
# FROM node:latest

RUN apt update && \
    apt install -y postgresql-client inotify-tools nodejs

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation

RUN mix local.hex --force
RUN mix local.rebar --force

# Compile the project
RUN mix do compile

CMD ["app/entrypoint.sh"]