class AddColumnToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :organizer, :boolean
  end
end
