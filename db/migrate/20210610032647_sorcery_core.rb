class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :store, index: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.boolean :admin, default: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
