class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]+\z/}
    validates :area, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :house_number, format: { with: /\A[a-z0-9]+\z/}
    validates :phone_number, format: { with: /\A[0-9]+\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area: area, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: )
  end
end