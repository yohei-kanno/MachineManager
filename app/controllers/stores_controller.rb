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
      flash[:mysuccess] = "登録が完了しました"
    else
      flash.now[:mydanger] = "登録出来ませんでした"
      render :new
    end
  end
  
  def back
    @store = Store.new
  end
  
  def back_create
    @store = Store.find_by(
        name: params[:store][:name],
        code: params[:store][:code]
        )
    if @store && @store.users.count == 0
        redirect_to new_store_admin_user_path(@store.id)
        flash[:mysuccess] = "管理者登録をして下さい"
    else
      redirect_to back_stores_path
      flash[:mydanger] = "該当の店舗は存在しないか管理者が既に登録されています"
    end
    
  end
  
  private
  def params_store
    params.require(:store).permit(:name,:pachinko_num,:slot_num, :code)
  end
end
