# == Schema Information
#
# Table name: reservations
#
#  id          :integer          not null, primary key
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  company_id  :integer
#  room_id     :integer
#  paid        :boolean          default(FALSE)
#

class Reservation < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :services
  belongs_to :room
  belongs_to :company
  has_one :receipt, dependent: :destroy
  attr_accessible :end_date, :start_date, :customer_ids, :room_id, :company_id

  scope :unpaid, where(:paid => false)


  def full_name
    "#{customers.first.initial_name} in #{room.name}"
  end

  # def pay
  #   self.paid = true
  #   self.save
  # end

  # def unpay
  #   self.paid = false
  #   self.save
  # end

  def paid?
    !receipt.nil?
  end

  def nights
    (end_date - start_date).to_i
  end

  def service_fees
    price = 0
    if !services.empty?
      services.each do |service|
        price += service.price
      end
    end
    price
  end

  def room_price
    nights * room.room_type.price
  end

  def total_price
    room_price + service_fees
  end
end
