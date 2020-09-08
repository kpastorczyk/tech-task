class Order::LineItemsController < ApplicationController
  before_action :set_order_line_item, only: [:show, :update, :destroy]
  before_action :set_order

  # GET /order/line_items
  def index
    @order_line_items = @order.line_items

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
      render json: @order_line_item, status: :created
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
  def set_order_line_item
    @order_line_item = Order::LineItem.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def order_line_item_params
    params.require(:order_line_item).permit( :name, :price).merge!(order_id: @order.id)
  end
end
