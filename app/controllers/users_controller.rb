class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def index
    @store = Store.find(params[:store_id])
    @users = @store.users.all
  end
  
  def new
    @store = Store.find(params[:store_id])
    @user = @store.users.build
  end
  
  def create
    @store = Store.find(params[:store_id])
    @user = @store.users.build(user_params)
    if @user.save
      redirect_to store_users_path
      flash[:success] = "登録が完了しました"
    else
      flash.now[:danger] = "登録出来ませんでした"
      render :new
    end
  end
  
  def edit; end
  
  def update
    @store = Store.find(params[:store_id])
    @user = @store.users.find(params[:id])
    if @user.update(user_params)
      redirect_to store_users_path
      flash[:success] = "更新しました"
    else
      redirect_to store_users_path
      flash[:danger] = "入力内容に不備があった為更新出来ませんでした"
      
    end
  end
  
  
  def destroy
    @store = Store.find(params[:store_id])
    @user = @store.users.find(params[:id])
    @user.destroy
    redirect_to store_users_path
    flash[:danger] = "削除しました"
  end
  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmaion, :store_id)
  end
end