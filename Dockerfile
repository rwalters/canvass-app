FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
ENV PORT=80
ENV MIX_ENV=prod BRUNCH_ENV=production

# Update elixir
RUN mix local.hex --force \
  && mix local.rebar --force

# Cache elixir deps
ADD mix.* ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD package.json ./
RUN npm install babel-preset-env --save-dev \
  && npm install

ADD . ./

# Run frontend build, compile, and digest assets
RUN ./node_modules/brunch/bin/brunch build \
  && mix do compile, phx.digest

USER default

CMD ["mix", "phx.server"]
