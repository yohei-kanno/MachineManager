class User < ApplicationRecord
  authenticates_with_sorcery!
  
  belongs_to :store
  
  enum admin: { general: false, admin: true }
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :admin, inclusion: ["admin", "general"]
  
end
