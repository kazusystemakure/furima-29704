class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def checked
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price, :image). merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to "http://localhost:3000/users/sign_in"
    end
  end
end
