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

require 'spec_helper'

describe Reservation do
  pending "add some examples to (or delete) #{__FILE__}"
end
