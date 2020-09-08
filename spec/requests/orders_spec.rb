require 'rails_helper'

RSpec.describe "/orders", type: :request do
  let(:valid_attributes) {
    attributes_for(:order)
  }

  let(:invalid_attributes) {
    attributes_for(:order, person_name: nil)
  }

  let(:valid_headers) {
    {}
  }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order" do
        expect {
          post orders_url,
               params: { order: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Order, :count).by(1)
      end

      it "renders a JSON response with the new order" do
        post orders_url,
             params: { order: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(JSON.parse(response.body)["value"]).to eq(0)
        expect(JSON.parse(response.body).keys).to match_array(%w[id person_name created_at value line_items])
      end
    end
  end
end
