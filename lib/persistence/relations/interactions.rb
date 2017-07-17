module Persistence
  module Relations
    class Interactions < ROM::Relation[:sql]
      schema(:interactions) do
        attribute :id, Types::Serial
        attribute :voter_id, Types::Strict::Int
        attribute :user_id, Types::Strict::Int
        attribute :discussed,          Types::Strict::Bool
        attribute :registered_to_vote, Types::Strict::Bool
        attribute :registered_to_change_affiliation, Types::Strict::Bool
        attribute :refused,        Types::Strict::Bool
        attribute :other_language, Types::Strict::Bool
        attribute :not_home,       Types::Strict::Bool
        attribute :moved,          Types::Strict::Bool
        attribute :dead,           Types::Strict::Bool
      end

      def by_id(id)
        where(id: id)
      end
    end
  end
end
