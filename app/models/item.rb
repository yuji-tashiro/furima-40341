class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :name,         presence: true
  validates :description,  presence: true
  validates :category_id,  presence: true, numericality: { other_than: 0 }
  validates :condition_id, presence: true, numericality: { other_than: 0 }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 0 }
  validates :prefecture_id,   presence: true, numericality: { other_than: 0 }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 0 }
  validates :price,           presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
end
