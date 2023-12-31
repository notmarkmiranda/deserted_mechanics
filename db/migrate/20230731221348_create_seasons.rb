class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons do |t|
      t.references :league, null: false, foreign_key: true
      t.boolean :active
      t.boolean :completed, null: false, default: false
      t.boolean :overall_standings, null: false, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
