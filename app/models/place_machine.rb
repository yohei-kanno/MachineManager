class PlaceMachine < ApplicationRecord
  belongs_to :place
  belongs_to :machine
  
  def self.create_place_machine!(machine)
        PlaceMachine.create!(
          machine_id: machine.id,
          place_id: machine.store.places.where(name: machine.place).ids[0]
        )
  end
  
  def self.update_place_machine!(machine)
    pms = where(machine_id: machine.id)
    pms.update(
      machine_id: machine.id,
      place_id: machine.store.places.where(name: machine.place).ids[0]
    )
  end
end
