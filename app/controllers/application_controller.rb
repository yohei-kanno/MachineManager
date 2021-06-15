class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :user_admin?
  
  protected
  
  def not_authenticated
    # redirect_to login_url
  end
  
  def user_admin?
    if !current_user.admin?
      redirect_to root_url
    end
  end
end
