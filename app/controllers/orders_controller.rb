class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, except: [:index]

  def index
    @order_address = OrderAddress.new
    redirect_to new_user_session_path if current_user.id == @item.user_id
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      # redirect_to item_orders_pathでは、エラーは表示されない。
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
