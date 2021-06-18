class ChangeDatatyper < ActiveRecord::Migration[6.1]
  def change
    change_column :machines, :place, :string
  end
end
