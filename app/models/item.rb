class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :category, numericality: { other_than: 1 } 
  validates :status, numericality: { other_than: 1 } 
  validates :shipping_fee, numericality: { other_than: 1 } 
  validates :prefecture, numericality: { other_than: 1 } 
  validates :scheduled_delivery, numericality: { other_than: 1 }  

end
