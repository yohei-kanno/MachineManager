class Store < ApplicationRecord
  
  has_many :users
  
  validates :name, presence: true
  validates :pachinko_num, presence: true, numericality: true, length:{maximum: 4}
  validates :slot_num, presence: true, numericality: true, length:{maximum: 4}
  validates :code, presence: true, numericality: true, uniqueness: true, 
  length:{
    maximum: 8,
    minimum: 8,
    message: "8桁数字で入力して下さい"  
  }
end
