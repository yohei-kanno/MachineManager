class MachinesController < ApplicationController
  before_action :set_store, only: %i[ index create update destroy]
  
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
      ActiveRecord::Base.transaction do
        if @machine.save
          PlaceMachine.place_machine!(@machine)
          format.html{
            redirect_to store_machines_path(current_user.store.id)
            flash[:mysuccess] = t("flash.success_create")
          }
        else
          format.js
        end
      end
    rescue StandardError
      format.html{
      redirect_to store_machines_path(current_user.store.id)
      flash[:mydanger] = t("flash.error")
    }
    end
  end
            
  
    
  def edit; end
  
  def update
    @machine = @store.machines.find(params[:id])
    respond_to do |format|
      ActiveRecord::Base.transaction do
        if @machine.update(params_machine)
          PlaceMachine.place_machine!(@machine)
          format.html{
            redirect_to store_machines_path(@store.id)
            flash[:mysuccess] = t("flash.success_update")
          }
        else
          format.js
        end
      end
    rescue StandardError
      format.html{
        redirect_to store_machines_path(current_user.store.id)
        flash[:mydanger] = t("flash.error")
      }
    end
  end
        
          
  def destroy
    @machine = @store.machines.find(params[:id])
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
end
