# == Schema Information
#
# Table name: companies
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  cnpj       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Company < ApplicationRecord
  has_many :events
  belongs_to :user
end
