class AddDeletedAtToLeagues < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :deleted_at, :datetime
    add_index :leagues, :deleted_at 
  end
end
