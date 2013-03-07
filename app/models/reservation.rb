# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reservation < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :rooms
  belongs_to :company
  # has_many :occupants, class_name: "Customer"
  
  attr_accessible :end_date, :start_date, :customer_ids, :room_ids, :company_id#, :occupants

  def full_name
    "#{start_date} - #{end_date} for #{customers.first.full_name}"
  end
end
