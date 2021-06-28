class StoresController < ApplicationController
  skip_before_action :user_admin?
  skip_before_action :require_login
  
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
    params.require(:store).permit(:name,:pachinko_num,:slot_num, :code)
  end
  
  def params_back_store
    params.require(:store).permit(:name, :code)
  end
end
