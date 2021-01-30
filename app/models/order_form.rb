class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { with: /\A[0-9]+\{,11}\z/, message: 'Half-width number' }
  end

  def save
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, addresses: addresses, building: building, phone_number: phone_number, user_id: user.id)
  end
end