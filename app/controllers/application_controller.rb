class ApplicationController < ActionController::Base
  before_action :check_user_account_status, unless: :devise_controller?

  protected

  def check_user_account_status
    return if controller_name.in?(['users', 'volunteers', 'companies']) || current_user.blank?
    redirect_to user_account_select_path if current_user.role.nil?
  end
end
