class User < ApplicationRecord
  authenticates_with_sorcery!
  
  belongs_to :store
  
  enum admin: { general: false, admin: true }
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 },on: :create
  validates :password, confirmation: true
  validates :admin, inclusion: ["admin", "general"]
  
end
