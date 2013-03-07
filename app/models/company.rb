# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  has_many :customers
  has_many :reservations
  attr_accessible :name, :number
  
  validates :name, :uniqueness => true
  validates :name, presence: true
  validates_numericality_of :number, :only_integer => true
end
