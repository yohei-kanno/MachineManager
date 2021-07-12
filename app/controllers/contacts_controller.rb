class ContactsController < ApplicationController
  before_action :set_store_user, only: %i[ confirm create ]
  
  skip_before_action :user_admin?
  skip_before_action :require_login
  skip_before_action :current_user?
  
  def new
    @contact = Contact.new
    @user = current_user
    @store = current_user.store
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  
  def create
    @contact = Contact.new(contact_params)
    if params[:back].present?
      render :new
      return
    end
    
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to root_path
      flash[:mysuccess] = t("flash.success_send_contact")
    else
      render :new
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  
  def set_store_user
    @user = current_user
    @store = current_user.store
  end
end
