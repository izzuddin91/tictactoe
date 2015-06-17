class CreateUsergames < ActiveRecord::Migration
  def change
    create_table :usergames do |u|
      u.integer :user_id
      u.integer :move_num
      u.string :box
      u.integer :game_id
      u.timestamps
    end
  end
end
