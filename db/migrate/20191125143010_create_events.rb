class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.time :start_time
      t.time :deadline

      t.timestamps
    end
  end
end
