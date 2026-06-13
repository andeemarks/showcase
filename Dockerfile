FROM hexpm/elixir:1.19.5-erlang-26.3.4-alpine AS build

RUN apk add --no-cache build-base git curl npm

WORKDIR /app

COPY . /app

RUN mix local.hex --force \
    && mix local.rebar --force

RUN mix deps.get --only prod
RUN mix deps.compile
RUN mix assets.deploy
RUN MIX_ENV=prod mix release --overwrite

FROM alpine:3.18.4 AS app
RUN apk add --no-cache libstdc++ openssl ncurses-libs
WORKDIR /app
COPY --from=build /app/_build/prod/rel/showcase .
ENV HOME=/app
ENV PORT 4000
EXPOSE 4000
CMD ["bin/showcase", "start"]
