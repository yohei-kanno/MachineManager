class PlacesController < ApplicationController
  
  before_action :set_store, only: %i[ index new create update destroy]
  before_action :set_place, only: %i[ update destroy ]
  skip_before_action :current_user?
  skip_before_action :user_admin?
  
  def index
    @places = @store.places.all
    @place = @store.places.build
  end
  
  def new
    @place = @store.places.build
  end
  
  def create 
    unless @store.places.pluck(:name).include?(params[:place][:name])
      place = @store.places.build(params_place)
      if place.save
        redirect_to store_machines_path
        flash[:mysuccess] = "登録が完了しました"
      else
        redirect_to store_machines_path
        flash[:mydanger] = "入力内容に不備があり登録出来ませんでした"
      end
    else
      redirect_to store_machines_path
      flash[:mydanger] = "店舗内に同じ倉庫があります"
    end
  end

      
    
  
  
  def edit;end
  
  def update
    @place.update(params_place)
    @place.machines.update(place: params[:place][:name])
    redirect_to store_places_path
  end
  
  def destroy
    if @place.count_of_place_is_0?
      @place.destroy
      redirect_to store_places_path
      flash[:mysuccess] = "削除しました"
    else
      redirect_to store_places_path
      flash[:mydanger] = "台情報が存在する為削除出来ません"
    end
  end
  
  private
  
  def params_place
    params.require(:place).permit(:name)
  end
  
  def set_store
    @store = current_user.store
  end
  
  def set_place
    @place = @store.places.find(params[:id])
  end
  
end
