class UsersController < ApplicationController
  before_action :authenticate_user!

  def account
    @company = Company.new
    @volunteer = Volunteer.new
    render layout: 'devise'
  end
end
