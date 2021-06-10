class User < ApplicationRecord
  authenticates_with_sorcery!
  
  belongs_to :store
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :admin, inclusion: [true, false]
  
end