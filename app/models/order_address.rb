class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefectures_id, :city, :addresses, :building, :phone_number, :order_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, length: {maximum: 11 }, numericality: { with: /\A[0-9]+\{,11}\z/, message: 'Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, addresses: addresses,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
