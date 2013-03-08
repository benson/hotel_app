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
  belongs_to :room
  belongs_to :company
  
  attr_accessible :end_date, :start_date, :customer_ids, :room_id, :company_id

  def full_name
    "#{start_date.to_s(:rfc822)} - #{end_date.to_s(:rfc822)} for #{customers.first.initial_name}"
  end
end
