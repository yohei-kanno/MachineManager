class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :user_admin?
  before_action :current_user?
  before_action :detect_mobile_variant
  
  
  protected
  
  def not_authenticated
    redirect_to login_url
    flash[:mydanger] = t("flash.require_login")
  end
  
  def user_admin?
    if current_user && !current_user.admin?
      redirect_to root_path
      flash[:mydanger] = t("flash.unauthorized")
    end
  end
  
  def current_user?
    redirect_to root_path if current_user
  end
  
  def grandadmin?
    redirect_to root_url if current_user && !current_user.grandadmin?
  end
  
  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ / iPhone | android /
  end
end
