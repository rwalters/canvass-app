require 'types'

module CanvassApp
  module Entities
    class Voter < Dry::Types::Struct
      attribute :id,                  Types::Int
      attribute :name,                Types::Strict::String
      attribute :email,               Types::Strict::String
      attribute :address,             Types::Strict::String
      attribute :category,            Types::Category
      attribute :party_registration,  Types::Strict::String
      attribute :only_call_for_vote_reminder, Types::Strict::Bool
    end
  end
end
