# frozen_string_literal: true

require "rails_helper"

describe Validations do
  subject(:validate) do
    feature_class.new(params).validate(params)
  end

  let(:feature_class) do
    Class.new do
      include Validations

      def initialize(params)
        @params = params
      end

      attr_reader :params

      def schema
        Class.new(Dry::Validation::Contract) do
          params do
            required(:first_name).filled(:string)
            required(:last_name).filled(:string)
            required(:age).value(:integer)
          end
        end.new
      end
    end
  end

  context "when params are valid" do
    let(:params) do
      {
        first_name: "John",
        last_name: "Doe",
        age: "18",
        unnecessary_param: "foo-bar"
      }
    end

    let(:expected_result) do
      {
        first_name: "John",
        last_name: "Doe",
        age: 18
      }
    end

    it "sanitizes and coerces params as a result" do
      expect(validate.success).to match expected_result
    end
  end

  context "when params are invalid" do
    let(:params) do
      {
        first_name: "John",
        last_name: nil,
        age: "eighteen"
      }
    end

    let(:expected_errors) do
      {
        last_name: ["must be filled"],
        age: ["must be an integer"]
      }
    end

    it "contains error message" do
      expect(validate.failure.last).to match expected_errors
    end
  end
end
