class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.belongs_to :movie, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.string :surname

      t.timestamps null: false
    end
  end
end
