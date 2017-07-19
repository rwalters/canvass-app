require 'canvass_app/repository'
require 'canvass_app/entities/interaction'

module CanvassApp
  module Persistence
    module Repositories
      class Interactions < CanvassApp::Repository[:interactions]
        relations :interactions

        def [](id)
          interactions.by_id(id).map_to(Entities::Interaction).one!
        end
      end
    end
  end
end
