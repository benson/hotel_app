class Service < ActiveRecord::Base
  attr_accessible :desc, :name, :price
  has_and_belongs_to_many :reservations
end
