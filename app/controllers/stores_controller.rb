class StoresController < ApplicationController
  skip_before_action :user_admin?
  skip_before_action :require_login
  skip_before_action :current_user?, only: %i[edit update]
  
  def new
    @admin_store = StoreUsers.new
  end
  
  def create
    @admin_store = StoreUsers.new(params_store)
    if @admin_store.save
      UserMailer.activation_needed_email(@admin_store).deliver_now
      redirect_to root_path
      flash[:mysuccess] = t("flash.send_mail")
    else
      flash.now[:mydanger] = t("flash.failure_create")
      render :new
    end
  end         
  
  def edit
    @store = current_user.store
  end
  
  def update
    @store = current_user.store
    respond_to do |format|
      if @store.update(params_update_store)
        format.html{
          redirect_to machines_path
          flash[:mysuccess] = t("flash.success_update")
        }
      else
        format.js
      end
    end
  end
          
  private
  def params_store
    params.require(:store_users).permit(:name,:pachinko_num,:slot_num, :code, :agreement, :first_name, :last_name, :email, :password, :password_confirmation)
  end
  
  def params_update_store
    params.require(:store).permit(:name, :pachinko_num, :slot_num)
  end
end
