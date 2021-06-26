class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :current_user?
  before_action :set_store, only: [:index, :new, :create, :update, :destroy, :add_admin, :add_general]
  before_action :set_user, only: [ :update, :destroy, :add_admin, :add_general]
  
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
      flash[:mysuccess] = "登録が完了しました"
    else
      flash.now[:mydanger] = "登録出来ませんでした"
      render :new
    end
  end
  
  def edit; end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{
        redirect_to store_users_path
        flash[:mysuccess] = "更新しました"
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
        @message = "削除しました" 
      }
    end
  end
  
  def add_admin
    respond_to do |format|
      @user.admin!
      format.js{
        @message = "管理者権限を付与しました"
      }
      format.html{
        redirect_to store_users_path(@store.id)
        flash[:mysuccess] = "管理者権限を付与しました"
      }
    end
  end
        
  def add_general
    respond_to do |format|
      @user.general!
      format.js{
        @message = "管理者権限を剥奪しました"
      }
      format.html{
        redirect_to store_users_path(@store.id)
        flash[:mysuccess] = "管理者権限を剥奪しました"
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
  
  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ / iPhone | android /  end
end
