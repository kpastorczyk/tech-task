require 'rails_helper'

RSpec.describe "/order/line_items", type: :request do
  let!(:order) { create(:order) }
  let(:valid_attributes) {
    attributes_for(:order_line_item, order_id: order.id)
  }

  let(:invalid_attributes) {
    attributes_for(:order_line_item, name: nil)
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # Order::LineItemsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Order::LineItem.create! valid_attributes
      get order_line_items_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      order_line_item = Order::LineItem.create! valid_attributes
      get order_line_item_url(order_line_item), as: :json
      expect(response).to be_successful
    end
  end

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

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: Faker::Name.name,
          price: 50
        }
      }

      it "updates the requested order_line_item" do
        order_line_item = Order::LineItem.create! valid_attributes
        patch order_line_item_url(order_line_item),
              params: { order_line_item: new_attributes }, headers: valid_headers, as: :json
        order_line_item.reload
        expect(order_line_item.name).to eq(new_attributes[:name])
        expect(order_line_item.price).to eq(new_attributes[:price])
      end

      it "renders a JSON response with the order_line_item" do
        order_line_item = Order::LineItem.create! valid_attributes
        patch order_line_item_url(order_line_item),
              params: { order_line_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the order_line_item" do
        order_line_item = Order::LineItem.create! valid_attributes
        patch order_line_item_url(order_line_item),
              params: { order_line_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested order_line_item" do
      order_line_item = Order::LineItem.create! valid_attributes
      expect {
        delete order_line_item_url(order_line_item), headers: valid_headers, as: :json
      }.to change(Order::LineItem, :count).by(-1)
    end
  end
end
