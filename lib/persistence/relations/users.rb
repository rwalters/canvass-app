module Persistence
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users) do
        attribute :id, Types::Serial
        attribute :email, Types::Strict::String
        attribute :password_digest, Types::Strict::String
        attribute :created_at, Types::Strict::Time
        attribute :updated_at, Types::Strict::Time
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
