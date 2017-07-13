CanvassApp::Container.finalize :settings do |container|
  init do
    require "canvass_app/settings"
  end

  start do
    settings = CanvassApp::Settings.load(container.config.root, container.config.env)
    container.register "settings", settings
  end
end
