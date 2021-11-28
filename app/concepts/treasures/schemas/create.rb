# frozen_string_literal: true

module Treasures
  module Schemas
    class Create < ::ApplicationContract
      module Types
        include Dry.Types()
      end

      params do
        required(:name).filled(:string)
        required(:latitude).filled(:decimal)
        required(:longitude).filled(:decimal)
        required(:photos).filled.array(Types.Instance(ActionDispatch::Http::UploadedFile))
        optional(:description).maybe(:string)
      end
    end
  end
end
