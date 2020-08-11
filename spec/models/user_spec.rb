require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context "登録できる時" do
      it "name、email、password、password_confirmation、first_name、last_name、sub_first_name、sub_last_name、birthdayが存在すれば登録できる事" do
        expect(@user).to be_valid
      end
    end
    context "登録できない時" do
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
      it "last_nameが空で登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it "sub_first_nameがひらがなで登録できない" do
        @user.sub_first_name = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include
        ("Sub first name is invalid")
      end
      it "sub_last_nameがひらがなで登録できない" do
        @user.sub_last_name = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include
        ("Sub last name is invalid")
      end
      it "birthdayが空で登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end
      it "passwordは半角英数混合でないと登録できない" do
        @user.password = "abcdefgh"
        @user.password_confirmation = "abcdefgh"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it "メールアドレスは@を含まなければ登録できない" do
        @user.email = "testemail"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it "パスワードが５文字以下だった場合登録できない" do
        @user.password = "abc1"
        @user.password_confirmation = "abc1"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）以外で入力した場合登録できない" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name is invalid")
      end
    end
  end
end
