class Admin::UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :user_admin?, only: [:new, :create]
  before_action :previous_url?, only: [ :new ]
  before_action :set_store

  def new
    @user = User.new
  end
  
  def create
    binding.pry
    @user = @store.users.build(user_params)
    if @user.save
      redirect_to login_url
      flash[:mysuccess] = "管理者登録が完了しました"
    else
      flash.now[:mydanger] = "登録出来ませんでした"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmaion, :store_id).merge(admin: true)
  end
  
  def set_store
    @store = Store.find(params[:store_id])
  end
    
  def previous_url?
    if !request.referer&.include?(new_store_path) && current_user
      redirect_to root_url
      flash[:mydanger] = "#{current_user.first_name}さん...何か悪い事しようとしてませんか？"
    end
  end
end
