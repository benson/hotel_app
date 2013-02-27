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
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :reservations
  attr_accessible :name, :number

end
