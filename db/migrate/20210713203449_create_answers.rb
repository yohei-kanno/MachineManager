class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :contact, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
