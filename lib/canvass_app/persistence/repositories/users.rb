require 'canvass_app/repository'
require 'canvass_app/entities/user'

module CanvassApp
  module Persistence
    module Repositories
      class Users < CanvassApp::Repository[:users]
        relations :users
        commands :create

        def [](id)
          users.by_id(id).map_to(Entities::User).one!
        end

        def by_email!(email)
          users.by_email(email).map_to(Entities::User).one!
        end

        def all
          users.order(:email).map_to(Entities::User)
        end
      end
    end
  end
end
