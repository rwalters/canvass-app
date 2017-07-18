module Persistence
  module Repositories
    class Interactions < CanvassApp::Repository[:interactions]
      relations :interactions

      def [](id)
        interactions.by_id(id).as(Entities::Interaction).one!
      end
    end
  end
end
