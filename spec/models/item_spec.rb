require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
      @item.image = fixture_file_upload("/files/test_image.png","image/png")
    end
    context "出品できる時" do
      it "ログインしてimage,name,explanation,genre_idstatue_id,fee_id,prefecture_id,days_id,priceが存在すれば出品できる事" do
        expect(@item).to be_valid
      end
    end
    context "出品できない時" do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと出品できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーが設定されていないと出品できない" do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre must be other than 1")
      end
      it "商品の状態が設定されていないと出品できない" do
        @item.statue_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Statue must be other than 1")
      end
      it "配送料負担が設定されていないと出品できない" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it "発送元地域が設定されていないと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送日数が設定されていないと出品できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it "価格が設定されていないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list")
      end
      it "価格が範囲外だと出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
