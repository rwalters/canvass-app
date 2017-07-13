module Test
  module WebHelpers
    module_function

    def app
      CanvassApp::Application.app
    end
  end
end
