require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '全ての項目が埋まっている' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品画像が選択されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空の場合' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品の説明が空の場合' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end

      it 'カテゴリーの情報が空の場合' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'カテゴリーの情報が選択されていない場合' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end

      it '商品の状態についての情報が空の場合' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end

      it '商品の状態についての情報が選択されていない場合' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'State Select'
      end

      it '配送料の負担についての情報が空の場合' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank"
      end

      it '配送料の負担についての情報が選択されていない場合' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden Select'
      end

      it '発送元の地域についての情報が空の場合' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end

      it '発送元の地域についての情報が選択されていない場合' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area Select'
      end

      it '発送までの日数についての情報が空の場合' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end

      it '発送までの日数についての情報が選択されていない場合' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery Select'
      end

      it '価格についての情報が空の場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が半角英数字混合の場合' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end

      it '価格が半角英字の場合' do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end

      it '価格が半角数字でない場合' do
        @item.price = '１２３４５６７'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end

      it '価格が¥300未満の場合' do
        @item.price = '22'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 300'
      end

      it '価格が¥10000000の場合' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 9999999'
      end
    end
  end
end
