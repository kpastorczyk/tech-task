require 'rails_helper'

RSpec.describe "/order/line_items", type: :request do
  let!(:order) { create(:order) }
  let(:valid_attributes) {
    attributes_for(:order_line_item, order_id: order.id)
  }

  let(:invalid_attributes) {
    attributes_for(:order_line_item, name: nil)
  }

  let(:valid_headers) {
    {}
  }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order::LineItem" do
        expect {
          post order_line_items_url,
               params: { order_line_item: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Order::LineItem, :count).by(1)
      end

      it "renders a JSON response with the new order_line_item" do
        post order_line_items_url,
             params: { order_line_item: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(JSON.parse(response.body).keys).to match_array(%w[id name price])
      end
    end

    context "with invalid parameters" do
      it "does not create a new Order::LineItem" do
        expect {
          post order_line_items_url,
               params: { order_line_item: invalid_attributes }, as: :json
        }.to change(Order::LineItem, :count).by(0)
      end

      it "renders a JSON response with errors for the new order_line_item" do
        post order_line_items_url,
             params: { order_line_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
