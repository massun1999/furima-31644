class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :house_number, :building, :phone

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :phone
  end

  validates :prefecture_id, presence: true, numericality: { other_than: 0 }

  def save
    Purchase.create(product_id: @product.id)
    Address.create(:postal, :cith, :houce_number, :building, :phone, purchase_id: purchase.id)
  end
  
end