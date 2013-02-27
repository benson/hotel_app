# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ActiveRecord::Base
  has_and_belongs_to_many :room_types
  has_and_belongs_to_many :reservations
  attr_accessible :name, :room_type_ids

  def booked
    res = reservations.where("start_date <= ? AND end_date >= ?", Date.today, Date.today)
    res.empty? ? nil : res.first
  end

  def check_in_today
    res = reservations.where("start_date == ?", Date.today)
    res.empty? ? nil : res.first
  end

  def check_out_today
    res = reservations.where("end_date == ?", Date.today)
    res.empty? ? nil : res.first
  end
end
