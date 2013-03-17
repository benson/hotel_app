# == Schema Information
#
# Table name: receipts
#
#  id             :integer          not null, primary key
#  date_paid      :date
#  factura_num    :integer
#  receipt_num    :integer
#  reservation_id :integer
#  customer_id    :integer
#  company_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  price          :decimal(, )
#  discount       :decimal(, )
#

class Receipt < ActiveRecord::Base
  attr_accessible :date_paid, :factura_num, :receipt_num, :price, :customer_id, :reservation_id, :discount
  belongs_to :reservation
  belongs_to :customer
  belongs_to :company

  before_save :apply_discount
  validates :reservation_id, presence: true
  def name
    id
  end

  def apply_discount
    if !discount.nil?
      self.price = self.reservation.total_price - (self.reservation.total_price * (self.discount)/100)
    end
  end
end
