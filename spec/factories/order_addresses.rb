FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefectures_id { '2' }
    city { '川崎市' }
    addresses { '川崎区' }
    building { '川崎ビル１２３号' }
    phone_number { '09012345678' }
  end
end
