class Reservation < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :companies
  attr_accessible :end_date, :start_date, :customer_ids, :room_ids, :company_ids

  def full_name
    "#{start_date} - #{end_date} for #{customers.first.full_name}"
  end
end
