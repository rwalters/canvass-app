module Test
  module DatabaseHelpers
    module_function

    def rom
      CanvassApp::Container["persistence.rom"]
    end

    def db
      CanvassApp::Container["persistence.db"]
    end
  end
end
