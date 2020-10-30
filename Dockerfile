FROM elixir:1.8.2-otp-22-alpine

RUN apk update
RUN apk upgrade --no-cache
RUN apk add --update nodejs npm
RUN apk add inotify-tools
RUN apk add postgresql-client
RUN mix local.rebar --force
RUN mix local.hex --force

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app

WORKDIR /app

CMD ["sh", "./entrypoint.sh"]