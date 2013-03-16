# == Schema Information
#
# Table name: customers
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  last_name      :string(255)
#  number         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  address_line_3 :string(255)
#  company_id     :integer
#

class Customer < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :reservations
  
  attr_accessible :company, :first_name, :last_name, :number, :company_id, :address_line_3, :address_line_2, :address_line_1, :reservation_ids, :company_attributes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_numericality_of :number, :only_integer => true

  accepts_nested_attributes_for :company, reject_if: proc { |attributes| attributes['name'].blank? }

  def full_name
    "#{last_name}, #{first_name}"
  end

  def initial_name
    "#{first_name.first}. #{last_name}"
  end

  def both
    "#{first_name} #{last_name}"
  end

  def one_line_address
    "#{address_line_1}, #{address_line_2}, #{address_line_3}"
  end
end
