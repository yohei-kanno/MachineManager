class Place < ApplicationRecord
  belongs_to :store
  
  has_many :place_machines,dependent: :destroy
  has_many :machines, through: :place_machines
  
  validates :name, presence: true
  
  def count_of_place_is_0?
    machines.count == 0
  end
end