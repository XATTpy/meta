class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :release
      t.integer :score
    end
    add_index :games, :title
    add_index :games, :score
  end
end
