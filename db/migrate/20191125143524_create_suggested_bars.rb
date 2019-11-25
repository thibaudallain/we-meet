class CreateSuggestedBars < ActiveRecord::Migration[5.2]
  def change
    create_table :suggested_bars do |t|
      t.integer :votes
      t.boolean :chosen
      t.references :event, foreign_key: true
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
