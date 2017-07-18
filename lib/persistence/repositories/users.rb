module Persistence
  module Repositories
    class Users < CanvassApp::Repository[:users]
      relations :users

      def [](id)
        users.by_id(id).as(Entities::User).one!
      end

      def by_email!(email)
        users.by_email(email).as(Entities::User).one!
      end
    end
  end
end
