class MachinesController < ApplicationController
  before_action :set_store, only: %i[ index create update destroy]
  
  def index
    @store = Store.find_by(params[:store_id])
    @machines = @store.machines.all
    @machine = @store.machines.build
  end
  
  def new; end
  
  def create
    @machine = @store.machines.create(params_machine)
    redirect_to store_machines_path(current_user.store.id)
  end
  
  def edit; end
  
  def update
    @machine = @store.machines.update(params_machine)
    redirect_to store_machines_path(current_user.store.id)
  end
  
  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy!
    redirect_to store_machines_path(current_user.store.id)
  end
    
    

  
  private
  
  def params_machine
    params.require(:machine).permit(:maker, :form_type, :name, :machine_status, :parts_status, :place, :certification, :remarks, :front_number, :flame_number, :board_number)
  end
  
  def set_store
    @store = Store.find_by(params[:store_id])
  end
  
end
