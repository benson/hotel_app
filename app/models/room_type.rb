# == Schema Information
#
# Table name: room_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  spaces     :integer
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomType < ActiveRecord::Base
  has_many :rooms
  attr_accessible :name, :price, :spaces
  validates :name, presence: true
  validates :price, presence: true
  validates :spaces, presence: true
end
