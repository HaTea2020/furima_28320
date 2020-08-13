class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :statue
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :genre_id
    validates :statue_id
    validates :fee_id
    validates :prefecture_id
    validates :days_id
    validates :price, inclusion: {in: 300..9999999}
    validates :user_id
  end
  validates :genre_id,:statue_id,:fee_id,:prefecture_id,:days_id,numericality: { other_than: 1 }

  belongs_to :user
  
end
