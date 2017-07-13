begin
  require "pry-byebug"
rescue LoadError
end

require_relative "canvass_app/container"

CanvassApp::Container.finalize!

require "canvass_app/application"
