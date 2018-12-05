# == Schema Information
#
# Table name: volunteers
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  cpf        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
