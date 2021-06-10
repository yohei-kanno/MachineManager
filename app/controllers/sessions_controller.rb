class SessionsController < ApplicationController
  def new
  end
  
  def create
    if @user = login(params[:email], params[:password])
      binding.pry
      if params[:code] == @user.store.code.to_s
        redirect_to login_path
      end
    else
      render :new
    end
  end
end
