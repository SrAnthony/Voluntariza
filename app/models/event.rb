# == Schema Information
#
# Table name: events
#
#  id          :bigint(8)        not null, primary key
#  start_date  :datetime
#  end_date    :datetime
#  latitude    :string(255)
#  longitude   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint(8)
#  description :text(65535)
#

class Event < ApplicationRecord
  belongs_to :company
end
