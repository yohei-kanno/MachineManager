class Admin::UsersController < ApplicationController
  before_action :user_count_0?
  before_action :set_store
  
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :user_admin?, only: [:new, :create]
  skip_before_action :current_user?, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = @store.users.build(user_params)
    if @user.save
      auto_login(@user)
      redirect_to store_machines_path(current_user.store.id)
      flash[:mysuccess] = t("flash.success_login")
    else
      flash.now[:mydanger] = t("flash.failure_create")
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :store_id).merge(admin: true)
  end
  
  def set_store
    @store = Store.find(params[:store_id])
  end
    
  def user_count_0?
    set_store
    unless @store.users.count.zero?
      redirect_to root_url
      flash[:mydanger] = t("flash.no_store")
    end
  end
end
