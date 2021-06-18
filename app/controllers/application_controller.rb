class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :user_admin?
  
  protected
  
  def not_authenticated
    redirect_to login_url
    flash[:mydanger] = "ログインをして下さい"
  end
  
  def user_admin?
    if !current_user || !current_user.admin?
      redirect_to root_url
      flash[:mydanger] = "権限がありません"
    end
  end
end
