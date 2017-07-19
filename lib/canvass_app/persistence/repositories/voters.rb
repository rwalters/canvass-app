require 'canvass_app/repository'
require 'canvass_app/entities/voter'

module CanvassApp
  module Persistence
    module Repositories
      class Voters < CanvassApp::Repository[:voters]
        relations :voters
        commands :create

        def [](id)
          voters.by_id(id).map_to(Entities::Voter).one!
        end

        def all
          voters.order(:email).map_to(Entities::Voter)
        end
      end
    end
  end
end
