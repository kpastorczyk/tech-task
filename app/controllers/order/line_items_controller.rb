class Order::LineItemsController < ApplicationController
  before_action :set_order_line_item, only: [:show, :update, :destroy]

  # GET /order/line_items
  def index
    @order_line_items = Order::LineItem.all

    render json: @order_line_items
  end

  # GET /order/line_items/1
  def show
    render json: @order_line_item
  end

  # POST /order/line_items
  def create
    @order_line_item = Order::LineItem.new(order_line_item_params)

    if @order_line_item.save
      render json: @order_line_item, status: :created, location: @order_line_item
    else
      render json: @order_line_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order/line_items/1
  def update
    if @order_line_item.update(order_line_item_params)
      render json: @order_line_item
    else
      render json: @order_line_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order/line_items/1
  def destroy
    @order_line_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line_item
      @order_line_item = Order::LineItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_line_item_params
      params.require(:order_line_item).permit(:order_id, :name, :price)
    end
end
