class Purchase < ApplicationRecord
  
  belongs_to :user
  bekongs_to :product
  has_one :address
end
