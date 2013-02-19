class Room < ActiveRecord::Base
  has_and_belongs_to_many :room_types
  has_and_belongs_to_many :reservations
  attr_accessible :name, :room_type_ids
end
