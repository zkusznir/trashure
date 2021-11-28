# frozen_string_literal: true

require "dry/monads"

class UseCase
  include Dry::Monads[:result, :do]
  include Validations
end
