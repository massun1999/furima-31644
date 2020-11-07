class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :source
  belongs_to_active_hash :shipping_day


  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
  end

  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id 
    validates :postage_id
    validates :source_id
    validates :shipping_day_id
  end 

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
