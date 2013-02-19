class Reservation < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :companies
  attr_accessible :end, :start, :customer_ids, :room_ids, :company_ids
end
