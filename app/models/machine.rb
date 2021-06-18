class Machine < ApplicationRecord
  belongs_to :store
  
  has_many :place_machines, dependent: :destroy
  has_many :places, through: :place_machines
  
  enum form_type: { pachinko: 0, slot: 1 }
  enum machine_status: { perfect: 0, unperfect: 1 }
  enum parts_status: { body: 0,  board: 1, flame: 2}
  enum certification: { acquired: 0,  unacquired: 1 }
  
  validates :name, presence: true
  validates :form_type, presence: true
  validates :maker, presence: true
  validates :machine_status, presence: true
  validates :parts_status, presence: true
  validates :place, presence: true
  validates :certification, presence: true
end
