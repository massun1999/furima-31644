class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence:true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence:true
  validates :postage_id, presence:true
  validates :source_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
end
