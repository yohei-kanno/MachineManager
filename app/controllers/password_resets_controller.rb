class PasswordResetsController < ApplicationController
  skip_before_action :user_admin?
  skip_before_action :require_login
  skip_before_action :current_user?
  
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      flash[:mysuccess] = t("flash.success_send_reset_password")
      redirect_to root_path
    else
      flash[:mydanger] = t("flash.failure_send_reset_password")
      redirect_to new_password_reset_path
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.password_confirmation.present? && @user.change_password(params[:user][:password])
      flash[:mysuccess] = t("flash.success_update_password")
      redirect_to root_path
    else
      flash.now[:mydanger] = t("flash.failure_update_password")
      render :edit
    end
  end
end
