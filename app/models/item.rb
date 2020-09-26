class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end

  validates_inclusion_of  :price, in: 300..9_999_999, message: 'Out of setting range'

  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_fee_id, numericality: { other_than: 1, message: 'Select' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: 'Select' }
end
