class CreatePlaceMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :place_machines do |t|
      t.references :place, null: false, foreign_key: true
      t.references :machine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
