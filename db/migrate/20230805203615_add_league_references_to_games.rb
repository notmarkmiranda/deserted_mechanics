class AddLeagueReferencesToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :league, null: true, foreign_key: true
    change_column_null :games, :season_id, true
  end
end
