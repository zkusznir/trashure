# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Treasures", type: :request do
  let!(:user) { create(:user) }

  describe "POST /api/v1/treasures" do
    subject(:create_treasure_request) { post "/api/v1/treasures", params: params, as: :json }

    context "201" do
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
          name: "Oldchool bedside table",
          latitude: 51.107883,
          longitude: 17.038538,
          description: "It needs a bit of refurbishment but it's a charming table",
          photos: [uploaded_file]
        }
      end

      it "returns new Treasure's details" do
        create_treasure_request

        expect(response).to have_http_status(:created)
        expect(response).to match_response_schema("treasures/show")
      end
    end

    context "422" do
      let(:params) do
        {
          name: nil,
          latitude: "invalid-latitude",
          longitude: 51.6,
          photos: [],
          description: nil
        }
      end

      it "returns error message" do
        create_treasure_request

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body).symbolize_keys).to match(
          {
            name: ["must be filled"],
            latitude: ["must be a decimal"],
            photos: ["must be filled"]
          }
        )
      end
    end
  end
end
