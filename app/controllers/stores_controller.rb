class StoresController < ApplicationController
  skip_before_action :user_admin?
  
  def new
    @store = Store.new
  end
  
  def create
    @store = Store.new(params_store)
    if @store.save
      redirect_to new_store_admin_user_path(@store.id)
      flash[:success] = "登録が完了しました"
    else
      flash.now[:danger] = "登録出来ませんでした"
      render :new
    end
  end
  
  private
  def params_store
    params.require(:store).permit(:name,:pachinko_num,:slot_num, :code)
  end
end
