# == Schema Information
#
# Table name: customers
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  last_name      :string(255)
#  number         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  address_line_3 :string(255)
#

require 'spec_helper'

describe Customer do
  pending "add some examples to (or delete) #{__FILE__}"
end
