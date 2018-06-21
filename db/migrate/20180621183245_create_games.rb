class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :game_type
      t.integer :play_time
      t.string :main_setup 

      t.timestamps
    end
  end
end
