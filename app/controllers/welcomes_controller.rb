class WelcomesController < ApplicationController
  skip_before_action :require_login
  skip_before_action :user_admin?
  skip_before_action :current_user?
  
  def new
    if current_user
      @store = current_user.store
    end
  end
end
