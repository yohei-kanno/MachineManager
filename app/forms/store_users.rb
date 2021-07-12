class StoreUsers
  include ActiveModel::Model
  include ActiveModel::Validations
  
  attr_accessor :name, :pachinko_num, :slot_num, :code, :first_name, :last_name, :email, :password, :password_confirmation, :store_id, :agreement, :admin
  
  with_options presence: true do
    with_options numericality: true do
      validates :pachinko_num, length: {
        maximum: 4,
        message: "4桁以内で入力して下さい"
      }
      
      validates :slot_num, length: {
        maximum: 4,
        message: "4桁以内で入力して下さい"
      }
      
      validates :code, length: {
        maximum: 8,
        minimum: 8,
        message: "は8桁で入力して下さい"
      }
    end
    validates :name
    validates :first_name
    validates :last_name
    validates :email
    validates :password
    validates :password_confirmation
  end
      
  validates :agreement, acceptance: { allow_nil: false, message: "に同意して下さい" }
  validates :password, confirmation: true
  
  def self.human(column)
    human_attribute_name(column)
  end
  
  def save
    return false if invalid?

    store = Store.new(
      name: name,
      pachinko_num: pachinko_num,
      slot_num: slot_num,
      code: code,
      agreement: agreement
    )
    return false unless store.save
    
    user = store.users.build(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      admin: true
    )
    user.save
  end
end
