require 'types'

module CanvassApp
  module Entities
    class User < Dry::Struct
      attribute :id,              Types::Int
      attribute :email,           Types::Strict::String
      attribute :password_digest, Types::Strict::String
    end
  end
end
