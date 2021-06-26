class Admin::UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :user_admin?, only: [:new, :create]
  skip_before_action :current_user?, only: [:new, :create]
  before_action :user_count_0?
  before_action :set_store

  def new
    @user = User.new
  end
  
  def create
    @user = @store.users.build(user_params)
    if @user.save
      redirect_to login_path
      flash[:mysuccess] = "管理者登録が完了しました"
    else
      flash.now[:mydanger] = "登録出来ませんでした"
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
    @store = Store.find(params[:store_id])
    if  @store.users.count > 0
      redirect_to root_url
      flash[:mydanger] = "何か悪い事しようとしてませんか？"
    end
  end
end
