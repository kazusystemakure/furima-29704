class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building, :phone_number

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order_id)
  end
end