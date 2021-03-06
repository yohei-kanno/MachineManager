class Store < ApplicationRecord
  
  include IdGenerator
  
  has_many :users, dependent: :destroy
  has_many :machines, dependent: :destroy
  has_many :places, dependent: :destroy
  
  validates :name, presence: true
  validates :pachinko_num, presence: true, numericality: true, length:{
    maximum: 4,
    message: "は4桁で入力して下さい"
  }
  
  validates :slot_num, presence: true, numericality: true, length:{
    maximum: 4,
    message: "は4桁で入力して下さい"
  }
  
  validates :code, presence: true, numericality: true, uniqueness: true, 
  length:{
    maximum: 8,
    minimum: 8,
    message: "は8桁数字で入力して下さい" 
  }
  
  validates :agreement, acceptance: { allow_nil: false, message: "に同意して下さい", on: :create }
end
