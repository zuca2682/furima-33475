require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入情報を保存するとき' do
      it '必要な情報を適切に入力されている場合' do
        expect(@order_address).to be_valid
      end
    end

    context '購入情報の保存に失敗するとき' do
      it 'tokenが入力されていない場合' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が入力されていない場合' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
      end
      it '郵便番号にハイフンが入力されていない場合' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県が選択されていない場合' do
        @order_address.prefectures_id = "1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures Select")
      end
      it '市区町村が入力されていない場合' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていない場合' do
        @order_address.addresses = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が入力されていない場合' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
      end
      it '電話番号にハイフンが入力されている場合' do
        @order_address.phone_number = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号が半角数字で入力されていない場合' do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
