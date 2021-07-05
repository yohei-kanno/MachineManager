class StoresController < ApplicationController
  skip_before_action :user_admin?
  skip_before_action :require_login
  skip_before_action :current_user?, only: [:edit, :update]
  
  def new
    @store = Store.new
  end
  
  def create
    @store = Store.new(params_store)
    if @store.save
      redirect_to new_store_admin_user_path(@store.id)
      flash[:mysuccess] = t("flash.success_create")
    else
      flash.now[:mydanger] = t("flash.failure_create")
      render :new
    end
  end
  
  def edit
    @store = Store.find(params[:id])
  end
  
  def update
    @store = Store.find(params[:id])
    if @store.update(params_store)
      redirect_to store_machines_path(current_user.store.id)
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
    params.require(:store).permit(:name,:pachinko_num,:slot_num, :code, :agreement)
  end
  
  def params_back_store
    params.require(:store).permit(:name, :code)
  end
end
