class AddColumnsToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :price_level, :integer
    add_column :bars, :photo_reference, :text
  end
end
