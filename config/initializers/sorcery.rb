Rails.application.config.sorcery.submodules = [:remember_me, :user_activation]
Rails.application.config.sorcery.configure do |config|
  
  config.user_config do |user|
    user.stretches = 1 if Rails.env.test?
    user.remember_me_for = 1209600
    user.user_activation_mailer = UserMailer
  end
  
  config.user_class = "User"
end
