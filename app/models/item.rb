class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :order
  has_one_attached :image

end