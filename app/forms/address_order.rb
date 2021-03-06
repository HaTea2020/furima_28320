class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city,:house_number, :building_name, :phone_number, :item_id,:user_id, :token
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :postal_code
    validates :token
  end
  validates :prefecture_id,numericality: { other_than: 1 }
  def save
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,phone_number: phone_number,item_id: item_id)
    Order.create!(user_id: user_id,item_id: item_id)
  end
end