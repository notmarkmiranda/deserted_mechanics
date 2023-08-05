class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :season, null: false, foreign_key: true
      t.datetime :date
      t.boolean :completed, default: false
      t.integer :buy_in
      t.string :location
      t.integer :estimated_player_count
      t.jsonb :payout_schedule

      t.timestamps
    end
  end
end
