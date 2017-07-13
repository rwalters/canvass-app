require "dry/web/container"

module CanvassApp
  class Container < Dry::Web::Container
    configure do
      config.name = :canvass_app
      config.listeners = true
      config.default_namespace = "canvass_app"
      config.auto_register = %w[lib/canvass_app]
    end

    load_paths! "lib"
  end
end
