class Machine < ApplicationRecord
  belongs_to :store
  
  enum form_type: { pachinko: 0, slot: 1 }
  enum machine_status: { perfect: 0, unperfect: 1 }
  enum parts_status: { body: 0,  board: 1, flame: 2}
  enum place: { ware1: 0, ware2: 1, ware3: 2, ware4: 3, ware5: 4  }
  
  
  validates :name, presence: true
  validates :form_type, presence: true
  validates :maker, presence: true
  validates :machine_status, presence: true
  validates :parts_status, presence: true
  validates :place, presence: true
  validates :certification, inclusion: [true, false]
  
  validates :front_number, presence: true, uniqueness: true
  validates :flame_number, presence: true, uniqueness: true
  validates :board_number, presence: true, uniqueness: true
end
