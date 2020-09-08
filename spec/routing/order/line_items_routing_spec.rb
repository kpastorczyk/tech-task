require "rails_helper"

RSpec.describe Order::LineItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/order/line_items").to route_to("order/line_items#index")
    end

    it "routes to #show" do
      expect(get: "/order/line_items/1").to route_to("order/line_items#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/order/line_items").to route_to("order/line_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/order/line_items/1").to route_to("order/line_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/order/line_items/1").to route_to("order/line_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/order/line_items/1").to route_to("order/line_items#destroy", id: "1")
    end
  end
end
