class RemoveDescriptionFromBars < ActiveRecord::Migration[5.2]
  def change
    remove_column :bars, :description, :text
  end
end
