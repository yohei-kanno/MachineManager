class MachinesController < ApplicationController
  before_action :set_store, only: %i[ index create update destroy]
  skip_before_action :user_admin?
  
  def index
    @place = @store.places.build
    @machine = @store.machines.build
    @q = @store.machines.ransack(params[:q])
    @machines = @q.result(distinct: true)
  end
  
  def new; end
  
  def create
    @machine = @store.machines.build(params_machine)
    if @machine.save
      PlaceMachine.create_place_machine(@machine, @store)
      redirect_to store_machines_path(current_user.store.id)
      flash[:mysuccess] = "登録が完了しました"
    else
      redirect_to store_machines_path(current_user.store.id)
      flash[:mydanger] = "入力内容に不備があり登録出来ませんでした"
    end
  end
  
  
  def edit; end
  
  def update
    @machine = @store.machines.find(params[:id])
    if @machine.update(params_machine)
      PlaceMachine.update_place_machine(@machine,@store)
      redirect_to store_machines_path(current_user.store.id)
      flash[:mysuccess] = "更新が完了しました"
    else
      redirect_to store_machines_path(current_user.store.id)
      flash[:mydanger] = "入力内容に不備があり更新出来ませんでした"
    end
  end
  
  
  def destroy
    @machine = Machine.find(params[:id])
    @success_msg = "#{@machine.name}(#{@machine.machine_status_i18n})を削除しました"
    @machine.destroy!
  end
    
    

  
  private
  
  def params_machine
    params.require(:machine).permit(:maker, :form_type, :name, :machine_status, :parts_status, :place, :certification, :remarks, :front_number, :flame_number, :board_number)
  end
  
  def set_store
    @store = current_user.store
  end
  
end
