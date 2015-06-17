class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |g|
      g.integer :player1_id
      g.integer :player2_id
      g.integer :starting_player_id
      g.integer :winner_id
      g.boolean :active, default: true
      g.boolean :ended, null: false, default: false
      g.timestamps
    end
  end
end
