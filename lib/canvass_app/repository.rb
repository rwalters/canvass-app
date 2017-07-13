# auto_register: false

require "rom-repository"
require "canvass_app/container"
require "canvass_app/import"

CanvassApp::Container.boot! :rom

module CanvassApp
  class Repository < ROM::Repository::Root
    include CanvassApp::Import.args["persistence.rom"]
  end
end
