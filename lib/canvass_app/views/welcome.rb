require "canvass_app/view/controller"

module CanvassApp
  module Views
    class Welcome < CanvassApp::View::Controller
      configure do |config|
        config.template = "welcome"
      end
    end
  end
end
