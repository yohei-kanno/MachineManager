class ChangeCloumnsNotnullAddPlaces < ActiveRecord::Migration[6.1]
  def change
    change_column_null :places, :name, false
  end
end
