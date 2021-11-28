# frozen_string_literal: true

require "rails_helper"

describe Treasures::UseCases::Create do
  subject(:create_treasure) { described_class.new.call(params, current_user) }

  let(:current_user) { create(:user) }

  context "when params are invalid" do
    let(:params) do
      {
        name: nil,
        latitude: "invalid-latitude",
        longitude: 51.6,
        photos: [],
        description: nil
      }
    end

    it "returns errors" do
      expect(create_treasure.failure).to match(
        {
          name: ["must be filled"],
          latitude: ["must be a decimal"],
          photos: ["must be filled"]
        }
      )
    end

    it "doesn't create a Treasure" do
      expect { create_treasure }.not_to change(Treasure, :count)
    end
  end

  context "when params are valid" do
    let(:test_file) { fixture_file_upload("spec/fixtures/images/bedside_table.png", "image/png") }
    let(:uploaded_file) do
      ActionDispatch::Http::UploadedFile.new(
        tempfile: test_file,
        filename: File.basename(test_file),
        content_type: "image/jpeg"
      )
    end

    let(:params) do
      {
        name: "Oldschool bedside table",
        latitude: 51.107883,
        longitude: 17.038538,
        description: "It needs a bit of refurbishment but it's a charming table",
        photos: [uploaded_file]
      }
    end

    it "creates a new Treasure with a Photo and correct explorer User" do
      expect { create_treasure }.to change(Treasure, :count).by(1)

      treasure = create_treasure.success
      expect(treasure.photos.size).to eq(1)
      expect(treasure.explorer).to eq(current_user)
    end
  end
end
