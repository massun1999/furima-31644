class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :source
  belongs_to_active_hash :shipping_day


  belongs_to :user
  has_one_attached :image

  with_options presence: true
    validates :image
    validates :name
    validates :explanation
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 } 
  validates :source_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 } 
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
