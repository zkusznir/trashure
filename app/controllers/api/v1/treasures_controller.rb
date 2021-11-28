# frozen_string_literal: true

module API
  module V1
    class TreasuresController < ApplicationController
      def create
        case Treasures::UseCases::Create.new.call(params.to_unsafe_h, current_user)
        in Success(treasure)
          @treasure = treasure

          render :show, status: :created
        in Failure(:validate, errors)
          render json: errors, status: :unprocessable_entity
        end
      end

      private

      # TODO: Use real User here once authentication is implemented
      def current_user
        User.first
      end
    end
  end
end
