class SessionsController < ApplicationController
  skip_before_action :user_admin?
  skip_before_action :require_login
  
  def new
    if current_user
      redirect_to store_machines_path(current_user.store.id)
    end
  end
  
  def create
    if current_user = login(params[:email], params[:password])
      if params[:code] == current_user.store.code.to_s
        redirect_to store_machines_path(current_user.store.id)
        flash[:mysuccess]="ログインしました"
      else
        logout
        render :new
        flash[:mydanger] = "ログイン出来ませんでした"
      end
    else
      flash.now[:mydanger] = "ログイン出来ませんでした"
      render :new
    end
  end
  
  def destroy
    logout
    flash[:mysuccess] = "ログアウトしました"
    redirect_to root_url
  end
end
