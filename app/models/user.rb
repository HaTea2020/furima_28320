class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :statue
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

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

  validates :genre,:statue,:fee,:prefecture,:day, numericality: { other_than: 1 }


  has_many :item
end

