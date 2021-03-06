class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: false }
    validates :first_name, format: {
      with:/[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: {
      with:/[ぁ-んァ-ン一-龥]/}
    validates :sub_first_name, format: {
      with:/\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
    validates :sub_last_name, format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
    validates :birthday
  end
  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}

  has_many :items
  has_many :orders
end

