# frozen_string_literal: true

# This module provides helper methods for validating any data structure (usually these are params)
# sent to the API by client and they are validated within the use case class).
#
# This module is based on `dry-validation` gem and performs validations with use of its implementation.
module Validations
  include Dry::Monads[:result]

  def validate(params)
    result = schema.call(params)
    result.success? ? Success(result.to_h) : Failure([__callee__, result.errors.to_h])
  end

  # This module expects class including it to implement a schema. It has to be a schema defined
  # with `dry-validation` or `dry-schema`.
  def schema
    raise NotImplementedError
  end

  private

  attr_reader :result
end
