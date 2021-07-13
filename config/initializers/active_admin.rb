ActiveAdmin.setup do |config|
 
  config.site_title = "Machine Manager"
  config.default_namespace = :manage
  config.authentication_method = false
  config.current_user_method   = false
  config.batch_actions = true
  config.skip_before_action :current_user?
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]
  config.localize_format = :long
end
