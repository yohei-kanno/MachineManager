class SessionsController < ApplicationController
  def new
  end
  
  def create
    if current_user = login(params[:email], params[:password])
      if params[:code] == current_user.store.code.to_s
        redirect_to store_machines_path(current_user.store.id)
      end
    else
      render :new
    end
  end
  
  def destroy
    logout
    # flash[:nsmysuccess] = "ログアウトしました"
    redirect_to root_url
  end
end
