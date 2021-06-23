class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :user_admin?
  before_action :current_user?
  
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
  
  def current_user?
    if current_user
      redirect_to store_machines_path(current_user.store.id) 
      flash[:mydanger] = "#{current_user.first_name}さん...何か悪い事しようとしてますか？"
    end
  end
end
