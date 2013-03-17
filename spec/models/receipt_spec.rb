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

require 'spec_helper'

describe Receipt do
  pending "add some examples to (or delete) #{__FILE__}"
end
