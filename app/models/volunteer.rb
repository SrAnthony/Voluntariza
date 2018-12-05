# == Schema Information
#
# Table name: volunteers
#
#  id         :bigint(8)        not null, primary key
#  phone      :string(255)
#  cpf        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Volunteer < ApplicationRecord
  belongs_to :user
end
