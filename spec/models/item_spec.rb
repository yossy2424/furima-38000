require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'nameとexplanationとcondition_idとpriceとcategory_idとuserとprefecture_idとchargeとdelivery_time_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を入力してください")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge を入力してください")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '商品名は40文字以上では登録できない' do
        @item.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '商品の説明は1000文字以内ではないと登録できない' do
        @item.explanation = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '価格は全角では保存できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it '価格が9999999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
  end