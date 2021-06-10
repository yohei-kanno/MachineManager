class Admin::UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @store = Store.find(params[:store_id])
    @user = User.new
  end
  
  def create
    @store = Store.find(params[:store_id])
    @user = @store.users.build(user_params)
    binding.pry
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmaion, :admin, :store_id).merge(admin: true)
  end
end
