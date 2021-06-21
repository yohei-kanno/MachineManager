class SessionsController < ApplicationController
  skip_before_action :user_admin?
  skip_before_action :require_login
  skip_before_action :current_user?, only: [:destroy]
  
  def new
  end
  
  def create
    if current_user = login(params[:email], params[:password])
      if params[:code] == current_user.store.code.to_s
        redirect_to store_machines_path(current_user.store.id)
        flash[:mysuccess]="ログインしました"
      else
        logout
        flash.now[:mydanger] = "ログイン出来ませんでした"
        render :new
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
