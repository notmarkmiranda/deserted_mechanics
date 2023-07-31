class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :private_league, default: false
      t.string :location

      t.timestamps
    end
  end
end
