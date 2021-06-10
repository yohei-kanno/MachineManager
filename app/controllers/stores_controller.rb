class StoresController < ApplicationController
  def new
    @store = Store.new
  end
  
  def create
    binding.pry
    @store = Store.create(params_store)
    redirect_to new_store_path
  end
  
  private
  def params_store
    params.require(:store).permit(:name,:pachinko_num,:slot_num, :store_code)
  end
end
