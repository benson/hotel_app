# == Schema Information
#
# Table name: customers
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  last_name      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  address_line_3 :string(255)
#  passport       :integer
#  dni            :ingeger
#  number         :integer
#

class Customer < ActiveRecord::Base
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :reservations
  attr_accessible :company, :first_name, :last_name, :number, :company_ids
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{last_name}, #{first_name}"
  end

  def initial_name
    "#{first_name.first}. #{last_name}"
  end
end
