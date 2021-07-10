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
      
      redirect_to root_path
      flash[:mysuccess] = t("flash.success_create")
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
    if @store.update(params_store)
      redirect_to machines_path
      flash[:mysuccess] = t("flash.success_update")
    else
      flash.now[:mydanger] = t("flash.failure_update")
      render :edit
    end
  end
  
  def back
    @store = Store.new
  end
  
  def back_create
    if (@store = Store.find_by(params_back_store))
        redirect_to new_store_admin_user_path(@store.id)
        flash[:mysuccess] = t("flash.add_admin")
    else
      redirect_to back_stores_path
      flash[:mydanger] = t("flash.no_store")
    end
    
  end
  
  private
  def params_store
    params.require(:store_users).permit(:name,:pachinko_num,:slot_num, :code, :agreement, :first_name, :last_name, :email, :password, :password_confirmation)
  end
  
  def params_back_store
    params.require(:store).permit(:name, :code)
  end
end
