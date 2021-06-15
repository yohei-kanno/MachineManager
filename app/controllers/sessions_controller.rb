class SessionsController < ApplicationController
  skip_before_action :user_admin?
  
  def new
  end
  
  def create
    if current_user = login(params[:email], params[:password])
      if params[:code] == current_user.store.code.to_s
        redirect_to store_machines_path(current_user.store.id)
        flash[:success]="ログインしました"
      else
        logout
        render :new
        flash[:danger] = "ログイン出来ませんでした"
      end
    else
      flash.now[:danger] = "ログイン出来ませんでした"
      render :new
    end
  end
  
  def destroy
    logout
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end
end
