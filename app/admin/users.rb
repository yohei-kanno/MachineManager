ActiveAdmin.register User do
  includes :store
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :store_id, :first_name, :last_name, :email, :crypted_password, :salt, :admin, :remember_me_token, :remember_me_token_expires_at, :activation_state, :activation_token, :activation_token_expires_at, :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at, :access_count_to_reset_password_page
  #
  # or
  #
  # permit_params do
  #   permitted = [:store_id, :first_name, :last_name, :email, :crypted_password, :salt, :admin, :remember_me_token, :remember_me_token_expires_at, :activation_state, :activation_token, :activation_token_expires_at, :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at, :access_count_to_reset_password_page]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
