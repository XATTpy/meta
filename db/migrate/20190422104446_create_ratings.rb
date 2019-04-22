class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :rating
      t.belongs_to :game, index: { unique: true }, foreign_key: true

      t.timestamps
    end
    add_index :ratings, :rating
  end
end
