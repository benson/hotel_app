# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Service < ActiveRecord::Base
  attr_accessible :desc, :name, :price
  has_and_belongs_to_many :reservations
  validates :name, :length => {maximum: 40}
  validates :desc, :length => {maximum: 255}
end
