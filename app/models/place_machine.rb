class PlaceMachine < ApplicationRecord
  belongs_to :place
  belongs_to :machine
  
  def self.create_place_machine(machine,store)
       pms= PlaceMachine.create(
        machine_id: machine.id,
        place_id: machine.store.places.where(name: machine.place).first.id
      )
  end
  
  def self.update_place_machine(machine, store)
    pms = where(machine_id: machine.id)
    pms.update(
      machine_id: machine.id,
      place_id: machine.store.places.where(name: machine.place).first.id
    )
  end
end
