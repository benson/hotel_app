# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_type_id :integer
#

class Room < ActiveRecord::Base
  belongs_to :room_type
  has_many :customers, :through => :reservations
  has_many :reservations
  attr_accessible :name, :room_type_id, :reservation_ids, :room_type_attributes

  accepts_nested_attributes_for :room_type, reject_if: proc { |attributes| attributes['name'].blank? }

  def booked(date = Date.today)
    res = reservations.where("start_date <= ? AND end_date >= ?", date,date)
    res.empty? ? nil : res.first
  end

  def check_in_today(date = Date.today)
    res = reservations.where("start_date = ?", date)
    res.empty? ? nil : res.first
  end

  def check_out_today(date = Date.today)
    res = reservations.where("end_date = ?", date)
    res.empty? ? nil : res.first
  end
end
