class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.references :store, null: false, foreign_key: true
      t.string :maker
      t.integer :form_type, default: 0
      t.string :name
      t.integer :machine_status, default: 0
      t.integer :parts_status, default: 0
      t.integer :place, default: 0
      t.boolean :certification, default: false
      t.string :remarks
      t.string :front_number
      t.string :flame_number
      t.string :board_number

      t.timestamps
    end
  end
end
