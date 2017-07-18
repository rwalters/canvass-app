module Persistence
  module Relations
    class Voters < ROM::Relation[:sql]
      schema(:voters) do
        attribute :id, Types::Serial
        attribute :name, Types::Strict::String
        attribute :email, Types::Strict::String
        attribute :address, Types::Strict::String
        attribute :category, Types::Category
        attribute :party_registration, Types::Strict::String
        attribute :only_call_for_vote_reminder, Types::Strict::Bool
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
