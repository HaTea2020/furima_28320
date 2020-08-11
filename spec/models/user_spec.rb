require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "name、email、password、password_confirmation、first_name、last_name、sub_first_name、sub_last_name、birthdayが存在すれば登録できる事" do
      expect(@user).to be_valid
    end
    it "nicknameが空で登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "emailが空で登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "passwordが空で登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
    it "first_nameが空で登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it "sub_first_nameがひらがなで登録できない" do
      @user.sub_first_name = "ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include
      ("Sub first name is invalid")
    end
    it "birthdayが空で登録できない" do
      @user.birthday = ""
      expect(@user.errors.full_messages).to include ("Birthday can't be blank")
    end
  end
end
