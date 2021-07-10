class UsersController < ApplicationController
  before_action :set_store, only:[ :index, :new, :create, :edit, :update, :destroy, :add_admin, :add_general]
  before_action :set_user, only: [ :update, :destroy, :add_admin, :add_general]
  before_action :current_user_redirect, only: [:add_admin, :add_general, :destroy]
  
  skip_before_action :require_login, only: [:new, :create, :activate]
  skip_before_action :current_user?
  
  def index
    @users = @store.users.all
  end
  
  def new
    @user = @store.users.build
  end
  
  def create
    @user = @store.users.build(user_params)
    if @user.save
      redirect_to users_path
      flash[:mysuccess] = t("flash.send_mail")
    else
      flash.now[:mydanger] = t("flash.failure_create")
      render :new
    end
  end
  
  def edit; end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{
        redirect_to users_path
        flash[:mysuccess] = t("flash.success_update")
      }
      else
        format.js
      end
    end
  end
      
  def destroy
    respond_to do |format|
      format.js{
        @user.destroy
        @message = t("flash.success_destroy")
      }
    end
  end
  
  def add_admin
    respond_to do |format|
      @user.admin!
      format.js{
        @message = t("flash.add_admin!")
      }
      format.html{
        redirect_to store_users_path(@store.id)
        flash[:mysuccess] = t("flash.add_admin!")
      }
    end
  end
        
  def add_general
    respond_to do |format|
      @user.general!
      format.js{
        @message = t("flash.remove_admin!")
      }
      format.html{
        redirect_to store_users_path(@store.id)
        flash[:mysuccess] = t("flash.remove_admin!")
      }
    end
  end
    
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:mysuccess] = t("flash.success_activate")
      auto_login(@user)
      redirect_to machines_path
    else
      not_authenticated
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :store_id)
  end
  
  def set_store
    @store = current_user.store
  end
  
  def set_user
    @user = @store.users.find(params[:id])
  end
  
  def current_user_redirect
    redirect_to root_url if current_user == @user
  end
end
