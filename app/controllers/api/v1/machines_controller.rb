class Api::V1::MachinesController < ApiController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end
  
  def index
    @store = current_user.store
    @machine = @store.machines.build
    @q = @store.machines.ransack(params[:q])
    @machines = @q.result(distinct: true)
    render json: @machines
  end
end