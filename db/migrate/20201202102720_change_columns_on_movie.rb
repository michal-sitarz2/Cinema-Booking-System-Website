class ChangeColumnsOnMovie < ActiveRecord::Migration[5.2]
  def change
    change_column_null :movies, :poster, false
  end
end
