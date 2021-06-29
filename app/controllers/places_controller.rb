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
            flash[:mysuccess] = t("flash.success_create")
          }
        else
          format.js
        end
      end
    else
      redirect_to store_machines_path
      flash[:mydanger] = t("flash.same_ware")
    end
  end
            
  def edit;end

  def update
    unless @store.places.pluck(:name).include?(params[:place][:name])
      respond_to do |format|
        ActiveRecord::Base.transaction do
          if @place.update(params_place)
            @place.machines.update(place: params[:place][:name])
            format.html{ 
              flash[:mysuccess] = t("flash.success_update")
              redirect_to store_places_path
            }            
          else
            format.js
          end
        end
      rescue StandardError
        format.html{ 
          flash[:mydanger] = t("flash.error")
          redirect_to store_places_path
        }        
      end
    else
      flash[:mydanger] = t("flash.same_ware")
      redirect_to store_places_path
    end
  end  
  
  def destroy
    if @place.count_of_place_is_0?
      respond_to do | format|
        format.js{
          @place.destroy
          @message = t("flash.success_destroy")
        }
      end 
    else
      respond_to do |format| 
        format.js{
          @message = t("flash.machine_in_ware")
        }
        format.html{
          redirect_to store_places_path(@store.id)
          flash[:mydanger] = t("flash.machine_in_ware")
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
