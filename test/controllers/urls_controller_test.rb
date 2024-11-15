# spec/requests/urls_spec.rb
require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "POST /encode" do
    it "creates a short URL for a valid URL" do
      post "/encode", params: { original_url: "https://example.com" }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to have_key("short_url")
    end

    it "returns an error for an invalid URL" do
      post "/encode", params: { original_url: "not_a_valid_url" }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "POST /decode" do
    let!(:url) { Url.create(original_url: "https://example.com") }

    it "returns the original URL for a valid short code" do
      post "/decode", params: { short_code: url.short_code }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["original_url"]).to eq("https://example.com")
    end

    it "returns an error for an invalid short code" do
      post "/decode", params: { short_code: "invalid_code" }
      expect(response).to have_http_status(:not_found)
    end
  end
end
