FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
EXPOSE 5000
ENV PORT=5000 MIX_ENV=prod PGHOST=db

# Cache elixir deps
ADD mix.* ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD package.json package.json
RUN npm install

ADD . .

# Run frontend build, compile, and digest assets
RUN brunch build --production && \
    mix do compile, phoenix.digest

USER default

CMD ["mix", "phoenix.server"]
