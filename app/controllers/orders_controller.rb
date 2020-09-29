class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture, :city, :address, :building, :phone_number)
  end

end
