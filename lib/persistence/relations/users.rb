module Persistence
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users) do
        attribute :id, Types::Serial
        attribute :email, Types::Strict::String
        attribute :password_digest, Types::Strict::String
      end

      def by_id(id)
        where(id: id)
      end

      def by_email(email)
        where(email: email)
      end
    end
  end
end
