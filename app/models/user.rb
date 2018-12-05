# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string(255)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def company?
    role == 'company'
  end

  def volunteer?
    role == 'volunteer'
  end

  def company
    Company.where(user_id: id).first
  end

  def volunteer
    Volunteer.where(user_id: id).first
  end

  def name
    return company.name if company?
    volunteer.name
  end
end
