Rails.application.config.sorcery.submodules = [:remember_me, :user_activation, :reset_password]
Rails.application.config.sorcery.configure do |config|
  
  config.user_config do |user|
    user.stretches = 1 if Rails.env.test?
    user.remember_me_for = 1209600
    user.reset_password_mailer = UserMailer
    user.user_activation_mailer = UserMailer
    user.reset_password_expiration_period = 1.day
    user.reset_password_time_between_emails = 0
    
    
  end
  
  config.user_class = "User"
end
