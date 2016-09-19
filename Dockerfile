FROM tsuru/elixir

MAINTAINER Daniel André <daniel@16hop.com.br>

RUN mkdir /phoenixapp
WORKDIR /phoenixapp

COPY ./ /phoenixapp
ENV MIX_ENV dev
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
ENV PORT 8080

CMD mix compile && mix ecto.create && mix ecto.migrate && mix phoenix.server
