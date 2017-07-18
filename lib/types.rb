require "dry-struct"

module Types
  include Dry::Types.module

  Category = Types::Strict::String.enum(%w{Committed Unaware Transactional})
end
