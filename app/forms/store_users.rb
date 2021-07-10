class StoreUsers
  include ActiveModel::Model
  
  attr_accessor :name, :pachinko_num, :slot_num, :code, :first_name, :last_name, :email, :password, :password_confirmation, :store_id, :agreement, :admin
  
  validates :name, presence: true
  validates :first_name, presence: true
  
  def save
    return false if invalid?
    store = Store.create(
      name: name,
      pachinko_num: pachinko_num,
      slot_num: slot_num,
      code: code,
      agreement: agreement
    )
    
    user = User.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      store_id: store.id,
      admin: true
    )
  end
end
