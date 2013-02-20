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
