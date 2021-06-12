class MachinesController < ApplicationController
  
  def index
    @store = Store.find_by(params[:code])
    @machines = Machine.all
  end
  
  def new
    @machines = Machine.new
  end
  
  def create
  end
end
