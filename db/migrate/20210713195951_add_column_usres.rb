class AddColumnUsres < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :grandadmin, :boolean, default: false
  end

end
