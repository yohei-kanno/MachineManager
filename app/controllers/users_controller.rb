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
    if @user.update(user_params)
      redirect_to store_users_path
      flash[:mysuccess] = "更新しました"
    else
      redirect_to store_users_path
      flash[:mydanger] = "入力内容に不備があった為更新出来ませんでした"
    end
  end
      
  
  
  def destroy
    @user.destroy
    redirect_to store_users_path
    flash[:mysuccess] = "削除しました"
  end
  
  def add_admin
    @user.admin!
    redirect_to store_users_path
    flash[:mysuccess] = "管理者権限を付与しました"
  end
    
  
  def add_general
    @user.general!
    redirect_to store_users_path
    flash[:mysuccess] = "管理者権限を剥奪しました"
  end
    
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmaion, :store_id)
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