class StoresController < ApplicationController
  def new
    @store = Store.new
  end
  
  def create
    @store = Store.create(params_store)
    if @store
      redirect_to new_store_admin_user_path(@store.id)
    else
      render :new
    end
  end
  
  private
  def params_store
    params.require(:store).permit(:name,:pachinko_num,:slot_num, :code)
  end
end
