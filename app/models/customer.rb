class Customer < ActiveRecord::Base
  attr_accessible :company, :first_name, :last_name, :number
  validates :first_name, presence: true
  validates :last_name, presence: true
end
