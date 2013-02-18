class RoomType < ActiveRecord::Base
  attr_accessible :name, :price, :spaces
  validates :name, presence: true
  validates :price, presence: true
  validates :spaces, presence: true
end
