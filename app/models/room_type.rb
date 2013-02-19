class RoomType < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  attr_accessible :name, :price, :spaces
  validates :name, presence: true
  validates :price, presence: true
  validates :spaces, presence: true
end
