class ChangeCloumnsNotnullAddMachines < ActiveRecord::Migration[6.1]
  def change
    change_column_null :machines, :maker, false
    change_column_null :machines, :form_type, false
    change_column_null :machines, :name, false
    change_column_null :machines, :machine_status, false
    change_column_null :machines, :parts_status, false
    change_column_null :machines, :place, false
    change_column_null :machines, :certification, false
  end
end
