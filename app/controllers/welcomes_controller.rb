class WelcomesController < ApplicationController
  skip_before_action :require_login
  skip_before_action :user_admin?
  
  def new
  end
end
