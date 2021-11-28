# frozen_string_literal: true

class Treasure < ApplicationRecord
  belongs_to :explorer, class_name: "User", foreign_key: :user_id

  has_many :photos, dependent: :destroy
end
