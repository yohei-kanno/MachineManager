class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name
      t.references :store, limit:36, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
