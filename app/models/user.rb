class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: {
      with:/[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: {
      with:/[ぁ-んァ-ン一-龥]/}
    validates :sub_first_name, format: {
      with:/([ァ-ン]|ー)/}
    validates :sub_last_name, format: {
      with: /([ァ-ン]|ー)/}
    validates :birthday
  end
end
