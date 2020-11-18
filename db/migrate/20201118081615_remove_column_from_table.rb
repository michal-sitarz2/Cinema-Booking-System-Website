class RemoveColumnFromTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :actors, :string
  end
end
