require "dry-struct"
require "dry-types"

module Types
  include Dry::Types.module

  Category = Types::Strict::String.enum(%w{Committed Unaware Transactional})
end
