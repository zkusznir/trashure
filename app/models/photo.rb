# frozen_string_literal: true

class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)
end
