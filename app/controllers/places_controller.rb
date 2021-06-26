class PlacesController < ApplicationController
  
  before_action :set_store, only: %i[ index new create update destroy]
  before_action :set_place, only: %i[ update destroy ]
  before_action :detect_mobile_variant
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
      @place = @store.places.build(params_place)
      respond_to do |format|
        if @place.save
          format.html{
            redirect_to store_machines_path
            flash[:mysuccess] = "登録が完了しました"
          }
        else
          format.js
        end
      end
    else
      redirect_to store_machines_path
      flash[:mydanger] = "店舗内に同じ倉庫があります"
    end
  end
            
  def edit;end
  
  def update
    respond_to do |format|
      if @place.update(params_place)
        @place.machines.update(place: params[:place][:name])
        format.html{
          flash[:mysuccess] = "更新しました"
          redirect_to store_places_path
        }
      else
        format.js
      end
    end
  end
  
  def destroy
    if @place.count_of_place_is_0?
      respond_to do | format|
        format.js{
          @place.destroy
          @message = "削除しました"
        }
      end 
    else
      respond_to do |format| 
        format.js{
          @message = "台情報がある為削除出来ません"
        }
        format.html{
          redirect_to store_places_path(@store.id)
          flash[:mydanger] = "台情報がある為削除出来ません"
        }
      end
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
  
  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ / iPhone | android /
  end
  
end
