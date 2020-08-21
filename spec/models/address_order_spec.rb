require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe "#create" do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order = FactoryBot.build(:address_order, item_id: @item.id, user_id: @user.id)
    end
    context "購入できる時" do
      it "ログインしてカード情報、住所が入力されている場合購入できる" do
        expect(@order).to be_valid
      end
    end
    context "購入できない時" do
      it "クレジットカード情報が入力されていない時購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が入力されていない時購入できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank","Postal code is invalid. Include hyphen(-)")
      end
      it "都道府県が設定されていない時購入できない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市町村が入力されていない時購入できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が入力されていない時購入できない" do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が入力されていない時購入できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "郵便番号にハイフンが無いと購入できない" do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "電話番号にハイフンが有ると購入できない" do
        @order.phone_number = 123-456-7891
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
