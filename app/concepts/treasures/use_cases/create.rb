# frozen_string_literal: true

module Treasures
  module UseCases
    class Create < ::UseCase
      def call(params, current_user)
        validated_params = yield validate(params)
        create_params    = yield append_photos_to(validated_params, current_user)
        create_treasure(create_params)
      end

      private

      def append_photos_to(validated_params, current_user)
        parsed_params = validated_params.tap do |params|
          params[:photos]   = params[:photos].map { |photo_data| Photo.new(image: photo_data) }
          params[:explorer] = current_user
        end

        Success(parsed_params)
      end

      def create_treasure(params)
        Success(Treasure.create!(params))
      end

      ## HELPER METHODS

      def schema
        ::Treasures::Schemas::Create.new
      end
    end
  end
end
