class MachinesController < ApplicationController
  before_action :set_store, only: %i[ index create update destroy]
  before_action :detect_mobile_variant
  
  skip_before_action :user_admin?
  skip_before_action :current_user?
  
  PER = 10
  
  def index
    @place = @store.places.build
    @machine = @store.machines.build
    @q = @store.machines.ransack(params[:q])
    @machines = @q.result(distinct: true).page(params[:page]).per(PER)
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new; end
  
  def create
    @machine = @store.machines.build(params_machine)
    respond_to do |format|
      if @machine.save
        format.html{
        PlaceMachine.create_place_machine(@machine)
        redirect_to store_machines_path(current_user.store.id)
        flash[:mysuccess] = t("flash.success_create")
      }
      else
        format.html
        format.js
      end
    end
  end
  
    
  def edit; end
  
  def update
    @machine = @store.machines.find(params[:id])
    respond_to do |format|
      if @machine.update(params_machine)
        PlaceMachine.update_place_machine(@machine)
        format.html{
          redirect_to store_machines_path(@store.id)
          flash[:mysuccess] = t("flash.success_update")
        }
      else
        format.html
        format.js
      end
    end
  end
          
  def destroy
    @machine = Machine.find(params[:id])
    respond_to do |format|
      format.html{
        redirect_to store_machines_path(@store.id)
        flash[:mysuccess] = t("flash.success_destroy")
      }
      format.js{
        @machine.destroy
        @message = t("flash.success_destroy")
      }
        
    end
  end
        
    
  private
  
  def params_machine
    params.require(:machine).permit(:maker, :form_type, :name, :machine_status, :parts_status, :place, :certification, :remarks, :front_number, :flame_number, :board_number)
  end
  
  def set_store
    @store = current_user.store
  end
  
  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ / iPhone | android /
  end
end
