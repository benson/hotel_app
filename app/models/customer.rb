class Customer < ActiveRecord::Base
  has_and_belongs_to_many :companies
  attr_accessible :company, :first_name, :last_name, :number
  validates :first_name, presence: true
  validates :last_name, presence: true

end
