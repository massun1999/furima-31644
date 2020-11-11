class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :house_number, :building, :phone, :token, :product_id, :user_id

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :phone, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :token
  end


  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone: phone, purchase_id: purchase.id)
  end
  
end