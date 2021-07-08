class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @url  = activate_store_admin_user_url(user.store, user.activation_token)
    mail(to: user.email,
         subject: "MachineManagersへようこそ！")
  end
  
  def activation_success_email(user)
    @user = user
    @url  = store_machines_url(user.store.id)
    mail(to: user.email,
         subject: "アカウントが有効化されました。")
  end
end
