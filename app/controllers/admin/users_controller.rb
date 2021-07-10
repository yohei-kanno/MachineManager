class Admin::UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :activate]
  skip_before_action :user_admin?, only: [:new, :create, :activate]
  skip_before_action :current_user?, only: [:new, :create, :activate]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      flash[:mysuccess] = t("flash.send_mail")
    else
      flash.now[:mydanger] = t("flash.failure_create")
      render :new
    end
  end
  
  def activate
    if (@user = @store.users.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:mysuccess] = t("flash.success_activate")
      auto_login(@user)
      redirect_to new_store_path(current_user.store.id)
    else
      not_authenticated
    end
  end
      
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :store_id).merge(admin: true)
  end
end
