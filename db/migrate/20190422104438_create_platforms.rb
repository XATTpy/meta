class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.string :platform
      t.belongs_to :game, index: { unique: true }, foreign_key: true

      t.timestamps
    end
    add_index :platforms, :platform
  end
end
