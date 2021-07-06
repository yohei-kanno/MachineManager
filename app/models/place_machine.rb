class PlaceMachine < ApplicationRecord
  belongs_to :place
  belongs_to :machine
  
  def self.place_machine!(machine)
    machine.places.clear
    machine.places << Place.where(name: machine.place)
  end
end
