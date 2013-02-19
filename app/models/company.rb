class Company < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :reservations
  attr_accessible :name, :number

end
