class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery

  with_options presence: true do
    validates :name
    validates :explain
    validates :image

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :state_id
      validates :burden_id
      validates :area_id
      validates :delivery_id
    end

    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
  end
end
