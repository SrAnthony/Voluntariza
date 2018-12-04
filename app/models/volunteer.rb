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
#

class Volunteer < ApplicationRecord
end
