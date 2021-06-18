class PlaceMachine < ApplicationRecord
  belongs_to :place
  belongs_to :machine
  
  def self.create_place_machine(machine,store)
      create(
        machine_id: machine.id,
        place_id:  machine.store.places.first.id
      )
  end
  
  def self.update_place_machine(machine)
    pms = where(machine_id: machine.id)
    pms.update(
      machine_id: machine.id,
      place_id:  Place.where(name: machine.place).first.id
    )
  end
end
