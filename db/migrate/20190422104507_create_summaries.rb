class CreateSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :summaries do |t|
      t.text :summary
      t.string :pic
      t.string :developer
      t.belongs_to :game, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
