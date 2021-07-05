class UsersController < ApplicationController
  before_action :set_store
  before_action :set_user, only: [ :update, :destroy, :add_admin, :add_general]
  before_action :current_user_redirect, only:[:add_admin, :remove_admin, :destroy]
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :current_user?
  
  before_action :detect_mobile_variant
  
  def index
    @users = @store.users.all
  end
  
  def new
    @user = @store.users.build
  end
  
  def create
    @user = @store.users.build(user_params)
    if @user.save
      redirect_to store_users_path
      flash[:mysuccess] = t("flash.success_create")
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
        redirect_to store_users_path
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
    
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :store_id)
  end
  
  def set_store
    @store = Store.find(params[:store_id])
  end
  
  def set_user
    @user = @store.users.find(params[:id])
  end
  
  def current_user_redirect
    if current_user == @user
      redirect_to root_url
    end
  end
  
  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ / iPhone | android /
  end
end
