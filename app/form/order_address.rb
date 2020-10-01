class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :address
    validates :token
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  validates :prefecture, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
