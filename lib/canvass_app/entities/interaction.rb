require 'types'

module CanvassApp
  module Entities
    class Interaction < Dry::Types::Struct
      attribute :id,              Types::Int
      attribute :voter_id,        Types::Strict::Int
      attribute :user_id,         Types::Strict::Int
      attribute :discussed,       Types::Strict::Bool
      attribute :refused,         Types::Strict::Bool
      attribute :other_language,  Types::Strict::Bool
      attribute :not_home,        Types::Strict::Bool
      attribute :moved,           Types::Strict::Bool
      attribute :dead,            Types::Strict::Bool
      attribute :registered_to_vote, Types::Strict::Bool
      attribute :registered_to_change_affiliation, Types::Strict::Bool
    end
  end
end
